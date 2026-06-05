import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:angelshare_app/features/auth/presentation/pages/login_page.dart';
import 'package:angelshare_app/features/auth/auth_provider.dart';
import 'package:angelshare_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:angelshare_app/features/menu_catalog/domain/repositories/menu_catalog_repository.dart';
import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';
import 'package:angelshare_app/core/providers/ui_config_provider.dart';
import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/core/database/daos/ui_widget_dao.dart';
import 'package:angelshare_app/core/providers/data_state.dart';

class FakeAuthRepository implements AuthRepository {
  bool signInCalled = false;
  bool signUpCalled = false;
  String? lastEmail;

  @override
  Future<DataState<void>> signIn(String email) async {
    signInCalled = true;
    lastEmail = email;
    // Brief delay to allow widget tester to intercept loading state
    await Future.delayed(const Duration(milliseconds: 100));
    if (email == 'error@example.com') {
      return DataState.failure(Exception('Database sync failed'));
    }
    return const DataState.success(null);
  }

  @override
  Future<DataState<void>> signUp(String email) async {
    signUpCalled = true;
    lastEmail = email;
    await Future.delayed(const Duration(milliseconds: 100));
    return const DataState.success(null);
  }
}

class FakeMenuCatalogRepository implements MenuCatalogRepository {
  @override
  Future<DataState<List<AlcoholEntity>>> getCocktailsByCategory({required String category}) async {
    return const DataState.success([
      AlcoholEntity(
        id: '11007',
        name: 'Margarita',
        category: 'Cocktail',
        thumbnailUrl: 'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg',
      ),
    ]);
  }

  @override
  Future<DataState<List<String>>> getCategories() async {
    return const DataState.success(['Cocktail', 'Ordinary Drink']);
  }

  @override
  Future<DataState<DrinkDetailEntity>> getCocktailDetail({required String id}) async {
    return const DataState.success(DrinkDetailEntity(
      id: '11007',
      name: 'Margarita',
      category: 'Cocktail',
      glass: 'Cocktail glass',
      alcoholic: 'Alcoholic',
      instructions: 'Rub the rim of the glass with the lime slice...',
      ingredients: [
        IngredientEntity(name: 'Tequila', measure: '1 1/2 oz'),
      ],
      thumbnailUrl: 'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg',
    ));
  }

  @override
  Future<DataState<DrinkDetailEntity>> getRandomCocktail() async {
    final detailResult = await getCocktailDetail(id: '11007');
    return detailResult;
  }
}

class FakeUiConfigNotifier extends UiConfigNotifier {
  FakeUiConfigNotifier() : super(UiWidgetDao(AppDatabase()));

  @override
  Future<void> init() async {}

  @override
  Future<void> loadConfigs() async {}
}

void main() {
  testWidgets('LoginPage rendering and auth toggle test', (WidgetTester tester) async {
    // Set viewport size for ScreenUtil to prevent rendering overflow errors in testing environment
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final fakeRepository = FakeAuthRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(fakeRepository),
          uiConfigProvider.overrideWith((ref) => FakeUiConfigNotifier()),
          menuCatalogRepositoryProvider.overrideWithValue(FakeMenuCatalogRepository()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => const MaterialApp(
            home: LoginPage(),
          ),
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 100));

    // Verify initially in SECURE SIGN IN mode
    expect(find.text('SECURE SIGN IN'), findsOneWidget);
    expect(find.text('INITIALIZE SYNC'), findsOneWidget);

    // Toggle to Register mode
    await tester.tap(find.text('New fabricator? Record new profile key'));
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('CREATE ARCHIVE ACCOUNT'), findsOneWidget);
    expect(find.text('COMMENCE REGISTRATION'), findsOneWidget);

    // Toggle back to Sign In mode
    await tester.tap(find.text('Already have credentials? Access database'));
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('SECURE SIGN IN'), findsOneWidget);
  });

  testWidgets('LoginPage authentication actions flow test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final fakeRepository = FakeAuthRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(fakeRepository),
          uiConfigProvider.overrideWith((ref) => FakeUiConfigNotifier()),
          menuCatalogRepositoryProvider.overrideWithValue(FakeMenuCatalogRepository()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => const MaterialApp(
            home: LoginPage(),
          ),
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 100));

    // Enter empty email and press submit
    await tester.tap(find.text('INITIALIZE SYNC'));
    await tester.pump(const Duration(milliseconds: 100));

    // Verify validation error
    expect(find.text('Email cannot be empty'), findsOneWidget);

    // Enter normal email
    await tester.enterText(find.byType(TextField), 'user@example.com');
    await tester.tap(find.text('INITIALIZE SYNC'));
    
    // First pump: starts authenticating, triggers loading state
    await tester.pump();

    // Verify loading indicator is present (auth state is loading)
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Second pump: complete 100ms artificial repository delay
    await tester.pump(const Duration(milliseconds: 150));

    // Verify repository's signIn was called
    expect(fakeRepository.signInCalled, isTrue);
    expect(fakeRepository.lastEmail, 'user@example.com');
  });

  testWidgets('LoginPage handles authentication errors correctly', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final fakeRepository = FakeAuthRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(fakeRepository),
          uiConfigProvider.overrideWith((ref) => FakeUiConfigNotifier()),
          menuCatalogRepositoryProvider.overrideWithValue(FakeMenuCatalogRepository()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => const MaterialApp(
            home: LoginPage(),
          ),
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 100));

    // Enter error-triggering email
    await tester.enterText(find.byType(TextField), 'error@example.com');
    await tester.tap(find.text('INITIALIZE SYNC'));
    
    // Start authenticating
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Elapse error delay
    await tester.pump(const Duration(milliseconds: 150));

    // Verify error message is rendered
    expect(find.text('Database sync failed'), findsOneWidget);
  });
}
