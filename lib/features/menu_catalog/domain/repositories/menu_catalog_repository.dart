import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';

abstract class MenuCatalogRepository {
  Future<DataState<List<AlcoholEntity>>> getCocktailsByCategory({required String category});
  Future<DataState<List<String>>> getCategories();
  Future<DataState<DrinkDetailEntity>> getCocktailDetail({required String id});
  Future<DataState<DrinkDetailEntity>> getRandomCocktail();
}
