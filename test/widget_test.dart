// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:angelshare_app/main.dart';
import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/repositories/menu_catalog_repository.dart';
import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';

import 'package:angelshare_app/core/providers/ui_config_provider.dart';
import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/core/providers/ui_widget_models.dart';
import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/core/database/daos/ui_widget_dao.dart';

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
  FakeUiConfigNotifier() : super(UiWidgetDao(AppDatabase())) {
    state = const [
      ThemePresetConfig(id: 'theme_preset', name: 'Theme Preset', isEnabled: true, sortOrder: 0, colorSlot: 'primary', preset: 'gold'),
      WelcomeHeaderConfig(id: 'welcome_header', name: 'Welcome Header', isEnabled: true, sortOrder: 1, colorSlot: 'accent', title: "ANGEL'S SHARE"),
      AmbientOrbsConfig(id: 'ambient_orbs', name: 'Floating Ambient Orbs', isEnabled: true, sortOrder: 2, colorSlot: 'primary', showOrbs: true),
      CategoriesSliderConfig(id: 'categories_slider', name: 'Categories Slider', isEnabled: true, sortOrder: 3, colorSlot: 'primary'),
      CocktailCatalogConfig(id: 'cocktail_catalog', name: 'Cocktail Catalog Gallery', isEnabled: true, sortOrder: 4, colorSlot: 'accent', layoutType: 'carousel'),
      DrinkSelectorConfig(id: 'drink_selector', name: 'Circular Drink Selector', isEnabled: true, sortOrder: 5, colorSlot: 'primary'),
      SynthesizerConfig(id: 'synthesizer', name: 'Magical Synthesizer Tab Config', isEnabled: true, sortOrder: 6, colorSlot: 'muted', category: null),
    ];
  }

  @override
  Future<void> init() async {}

  @override
  Future<void> loadConfigs() async {}
}

void main() {
  testWidgets('Menu catalog page rendering smoke test', (WidgetTester tester) async {
    // Set viewport size to match mobile layout and prevent ScreenUtil scale overflows in test run
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    // Build our app under ProviderScope and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          menuCatalogRepositoryProvider.overrideWithValue(FakeMenuCatalogRepository()),
          currentUserEmailProvider.overrideWith((ref) => 'test@example.com'),
          uiConfigProvider.overrideWith((ref) => FakeUiConfigNotifier()),
        ],
        child: const MyApp(),
      ),
    );

    // Re-render to let the future complete and build the list
    await tester.pump(const Duration(milliseconds: 500));

    // Verify that the welcoming subheader and main glowing title render.
    expect(find.text('WELCOME TO'), findsOneWidget);
    expect(find.byType(NeonText), findsOneWidget);
    expect(find.text("ANGEL'S SHARE"), findsOneWidget);
  });
}
