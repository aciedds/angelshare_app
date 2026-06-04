import 'package:angelshare_app/features/favorites/domain/models/entities/favorite_item_entity.dart';

abstract class FavoritesRepository {
  Future<List<FavoriteItemEntity>> getFavorites();
  
  Future<void> addFavorite({
    required String idDrink,
    required String name,
    required String category,
    String? thumbnailUrl,
  });

  Future<void> removeFavorite({required String idDrink});
  
  Future<bool> isFavorite({required String idDrink});
}
