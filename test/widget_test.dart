// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:angelshare_app/main.dart';
import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/repositories/menu_catalog_repository.dart';
import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';

class FakeMenuCatalogRepository implements MenuCatalogRepository {
  @override
  Future<List<AlcoholEntity>> getCocktailsByCategory({required String category}) async {
    return const [
      AlcoholEntity(
        id: '11007',
        name: 'Margarita',
        category: 'Cocktail',
        thumbnailUrl: 'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg',
      ),
    ];
  }

  @override
  Future<List<String>> getCategories() async {
    return const ['Cocktail', 'Ordinary Drink'];
  }

  @override
  Future<DrinkDetailEntity> getCocktailDetail({required String id}) async {
    return const DrinkDetailEntity(
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
    );
  }

  @override
  Future<DrinkDetailEntity> getRandomCocktail() async {
    return getCocktailDetail(id: '11007');
  }
}

void main() {
  testWidgets('Menu catalog page rendering smoke test', (WidgetTester tester) async {
    // Build our app under ProviderScope and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          menuCatalogRepositoryProvider.overrideWithValue(FakeMenuCatalogRepository()),
        ],
        child: const MyApp(),
      ),
    );

    // Re-render to let the future complete and build the list
    await tester.pump();

    // Verify that the welcoming subheader and main glowing title render.
    expect(find.text('WELCOME TO'), findsOneWidget);
    expect(find.byType(NeonText), findsOneWidget);
    expect(find.text("ANGEL'S SHARE"), findsOneWidget);
  });
}
