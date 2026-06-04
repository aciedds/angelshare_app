import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/features/menu_catalog/data/datasources/local/drift/daos/alcohol_dao.dart';
import 'package:angelshare_app/features/menu_catalog/data/datasources/local/drift/tables/alcohol/alcohol_detail_table.dart';
import 'package:angelshare_app/features/menu_catalog/data/datasources/remote/cocktail_remote_data_source.dart';
import 'package:angelshare_app/features/menu_catalog/data/models/response/alcohol/drink_detail_response.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/repositories/menu_catalog_repository.dart';

class MenuCatalogRepositoryImpl implements MenuCatalogRepository {
  final CocktailRemoteDataSource _remoteDataSource;
  final AlcoholDao _alcoholDao;

  MenuCatalogRepositoryImpl({
    required CocktailRemoteDataSource remoteDataSource,
    required AlcoholDao alcoholDao,
  })  : _remoteDataSource = remoteDataSource,
        _alcoholDao = alcoholDao;

  @override
  Future<List<AlcoholEntity>> getCocktailsByCategory({required String category}) async {
    try {
      final cachedList = await _alcoholDao.getCocktailsByCategory(category: category);
      if (cachedList.isNotEmpty) {
        return cachedList
            .map((item) => AlcoholEntity(
                  id: item.idDrink,
                  name: item.strDrink,
                  category: item.strCategory,
                  thumbnailUrl: item.strDrinkThumb,
                ))
            .toList();
      }
    } catch (_) {
      // Local cache query failed, proceed to remote
    }

    final remoteResponse = await _remoteDataSource.getCocktailsByCategory(category: category);
    final drinks = remoteResponse.drinks;

    final tableDataList = drinks
        .map((item) => AlcoholTableData(
              idDrink: item.idDrink,
              strDrink: item.strDrink,
              strDrinkThumb: item.strDrinkThumb,
              strCategory: category,
              cachedAt: DateTime.now(),
            ))
        .toList();

    try {
      await _alcoholDao.insertCocktails(cocktails: tableDataList);
    } catch (_) {
      // Cache save failed, ignore and return domain items
    }

    return drinks
        .map((item) => AlcoholEntity(
              id: item.idDrink,
              name: item.strDrink,
              category: category,
              thumbnailUrl: item.strDrinkThumb,
            ))
        .toList();
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      final categories = await _remoteDataSource.getCategories();
      if (categories.isNotEmpty) {
        return categories;
      }
    } catch (_) {}

    return const ['Ordinary Drink', 'Cocktail', 'Shake', 'Cocoa', 'Shot'];
  }

  @override
  Future<DrinkDetailEntity> getCocktailDetail({required String id}) async {
    try {
      final cached = await _alcoholDao.getCocktailDetail(id: id);
      if (cached != null) {
        return DrinkDetailEntity(
          id: cached.idDrink,
          name: cached.strDrink,
          category: cached.strCategory,
          glass: cached.strGlass,
          alcoholic: cached.strAlcoholic,
          instructions: cached.strInstructions,
          ingredients: _mapDbIngredients(cached.ingredients),
          thumbnailUrl: cached.strDrinkThumb,
        );
      }
    } catch (_) {
      // Cache query failed, proceed to remote
    }

    final remoteResponse = await _remoteDataSource.getCocktailDetail(id: id);
    if (remoteResponse.drinks.isEmpty) {
      throw Exception('Cocktail details not found');
    }

    final remoteItem = remoteResponse.drinks.first;
    final ingredientsList = _extractIngredients(remoteItem);

    final dbIngredients = ingredientsList
        .map((e) => IngredientTableItem(name: e.name, measure: e.measure))
        .toList();

    final dbDetail = AlcoholDetailTableData(
      idDrink: remoteItem.idDrink,
      strDrink: remoteItem.strDrink,
      strDrinkThumb: remoteItem.strDrinkThumb,
      strCategory: remoteItem.strCategory ?? '',
      strGlass: remoteItem.strGlass ?? '',
      strAlcoholic: remoteItem.strAlcoholic ?? '',
      strInstructions: remoteItem.strInstructions ?? '',
      ingredients: dbIngredients,
      cachedAt: DateTime.now(),
    );

    try {
      await _alcoholDao.insertCocktailDetail(detail: dbDetail);
    } catch (_) {}

    return DrinkDetailEntity(
      id: remoteItem.idDrink,
      name: remoteItem.strDrink,
      category: remoteItem.strCategory ?? '',
      glass: remoteItem.strGlass ?? '',
      alcoholic: remoteItem.strAlcoholic ?? '',
      instructions: remoteItem.strInstructions ?? '',
      ingredients: ingredientsList,
      thumbnailUrl: remoteItem.strDrinkThumb,
    );
  }

  @override
  Future<DrinkDetailEntity> getRandomCocktail() async {
    final remoteResponse = await _remoteDataSource.getRandomCocktail();
    if (remoteResponse.drinks.isEmpty) {
      throw Exception('Random cocktail details not found');
    }

    final remoteItem = remoteResponse.drinks.first;
    final ingredientsList = _extractIngredients(remoteItem);

    // Save random drink detail to cache so it's queryable by ID later
    final dbIngredients = ingredientsList
        .map((e) => IngredientTableItem(name: e.name, measure: e.measure))
        .toList();

    final dbDetail = AlcoholDetailTableData(
      idDrink: remoteItem.idDrink,
      strDrink: remoteItem.strDrink,
      strDrinkThumb: remoteItem.strDrinkThumb,
      strCategory: remoteItem.strCategory ?? '',
      strGlass: remoteItem.strGlass ?? '',
      strAlcoholic: remoteItem.strAlcoholic ?? '',
      strInstructions: remoteItem.strInstructions ?? '',
      ingredients: dbIngredients,
      cachedAt: DateTime.now(),
    );

    try {
      await _alcoholDao.insertCocktailDetail(detail: dbDetail);
    } catch (_) {}

    return DrinkDetailEntity(
      id: remoteItem.idDrink,
      name: remoteItem.strDrink,
      category: remoteItem.strCategory ?? '',
      glass: remoteItem.strGlass ?? '',
      alcoholic: remoteItem.strAlcoholic ?? '',
      instructions: remoteItem.strInstructions ?? '',
      ingredients: ingredientsList,
      thumbnailUrl: remoteItem.strDrinkThumb,
    );
  }

  List<IngredientEntity> _extractIngredients(DrinkDetailResponseItem item) {
    final list = <IngredientEntity>[];
    final ingredientFields = [
      item.strIngredient1, item.strIngredient2, item.strIngredient3, item.strIngredient4,
      item.strIngredient5, item.strIngredient6, item.strIngredient7, item.strIngredient8,
      item.strIngredient9, item.strIngredient10, item.strIngredient11, item.strIngredient12,
      item.strIngredient13, item.strIngredient14, item.strIngredient15,
    ];
    final measureFields = [
      item.strMeasure1, item.strMeasure2, item.strMeasure3, item.strMeasure4,
      item.strMeasure5, item.strMeasure6, item.strMeasure7, item.strMeasure8,
      item.strMeasure9, item.strMeasure10, item.strMeasure11, item.strMeasure12,
      item.strMeasure13, item.strMeasure14, item.strMeasure15,
    ];

    for (var i = 0; i < 15; i++) {
      final ing = ingredientFields[i];
      final meas = measureFields[i];
      if (ing != null && ing.trim().isNotEmpty) {
        list.add(IngredientEntity(
          name: ing.trim(),
          measure: meas?.trim() ?? '',
        ));
      }
    }
    return list;
  }

  List<IngredientEntity> _mapDbIngredients(List<IngredientTableItem> dbItems) {
    return dbItems
        .map((item) => IngredientEntity(
              name: item.name,
              measure: item.measure,
            ))
        .toList();
  }
}
