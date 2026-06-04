import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';

abstract class MenuCatalogRepository {
  Future<List<AlcoholEntity>> getCocktailsByCategory({required String category});
  Future<List<String>> getCategories();
  Future<DrinkDetailEntity> getCocktailDetail({required String id});
  Future<DrinkDetailEntity> getRandomCocktail();
}
