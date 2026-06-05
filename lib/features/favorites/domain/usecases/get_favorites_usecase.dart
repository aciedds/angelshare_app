import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/favorites/domain/models/entities/favorite_item_entity.dart';
import 'package:angelshare_app/features/favorites/domain/repositories/favorites_repository.dart';

class GetFavoritesUseCase {
  final FavoritesRepository _repository;

  GetFavoritesUseCase({required FavoritesRepository repository}) : _repository = repository;

  Future<DataState<List<FavoriteItemEntity>>> execute() {
    return _repository.getFavorites();
  }
}
