import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/features/favorites/data/datasources/local/drift/daos/favorites_dao.dart';
import 'package:angelshare_app/features/favorites/domain/models/entities/favorite_item_entity.dart';
import 'package:angelshare_app/features/favorites/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDao _favoritesDao;

  FavoritesRepositoryImpl({required FavoritesDao favoritesDao}) : _favoritesDao = favoritesDao;

  @override
  Future<List<FavoriteItemEntity>> getFavorites() async {
    final list = await _favoritesDao.getFavorites();
    return list
        .map((item) => FavoriteItemEntity(
              id: item.idDrink,
              name: item.strDrink,
              category: item.strCategory,
              addedAt: item.addedAt,
              thumbnailUrl: item.strDrinkThumb,
            ))
        .toList();
  }

  @override
  Future<void> addFavorite({
    required String idDrink,
    required String name,
    required String category,
    String? thumbnailUrl,
  }) async {
    final favorite = FavoriteTableData(
      idDrink: idDrink,
      strDrink: name,
      strCategory: category,
      strDrinkThumb: thumbnailUrl,
      addedAt: DateTime.now(),
    );
    await _favoritesDao.addFavorite(favorite: favorite);
  }

  @override
  Future<void> removeFavorite({required String idDrink}) async {
    await _favoritesDao.removeFavorite(idDrink: idDrink);
  }

  @override
  Future<bool> isFavorite({required String idDrink}) async {
    return _favoritesDao.isFavorite(idDrink: idDrink);
  }
}
