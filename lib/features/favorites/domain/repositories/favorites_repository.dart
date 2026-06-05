import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/favorites/domain/models/entities/favorite_item_entity.dart';

abstract class FavoritesRepository {
  Future<DataState<List<FavoriteItemEntity>>> getFavorites();
  
  Future<DataState<void>> addFavorite({
    required String idDrink,
    required String name,
    required String category,
    String? thumbnailUrl,
  });

  Future<DataState<void>> removeFavorite({required String idDrink});
  
  Future<DataState<bool>> isFavorite({required String idDrink});
}
