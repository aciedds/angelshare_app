import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/favorites/data/datasources/local/drift/daos/favorites_dao.dart';
import 'package:angelshare_app/features/favorites/domain/models/entities/favorite_item_entity.dart';
import 'package:angelshare_app/features/favorites/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDao _favoritesDao;

  FavoritesRepositoryImpl({required FavoritesDao favoritesDao}) : _favoritesDao = favoritesDao;

  @override
  Future<DataState<List<FavoriteItemEntity>>> getFavorites() async {
    try {
      final list = await _favoritesDao.getFavorites();
      final domainList = list
          .map((item) => FavoriteItemEntity(
                id: item.idDrink,
                name: item.strDrink,
                category: item.strCategory,
                addedAt: item.addedAt,
                thumbnailUrl: item.strDrinkThumb,
              ))
          .toList();
      return DataState.success(domainList);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> addFavorite({
    required String idDrink,
    required String name,
    required String category,
    String? thumbnailUrl,
  }) async {
    try {
      final favorite = FavoriteTableData(
        idDrink: idDrink,
        strDrink: name,
        strCategory: category,
        strDrinkThumb: thumbnailUrl,
        addedAt: DateTime.now(),
      );
      await _favoritesDao.addFavorite(favorite: favorite);
      return const DataState.success(null);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> removeFavorite({required String idDrink}) async {
    try {
      await _favoritesDao.removeFavorite(idDrink: idDrink);
      return const DataState.success(null);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<DataState<bool>> isFavorite({required String idDrink}) async {
    try {
      final res = await _favoritesDao.isFavorite(idDrink: idDrink);
      return DataState.success(res);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }
}
