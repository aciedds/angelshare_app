import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/favorites/domain/repositories/favorites_repository.dart';

class RemoveFavoriteUseCase {
  final FavoritesRepository _repository;

  RemoveFavoriteUseCase({required FavoritesRepository repository}) : _repository = repository;

  Future<DataState<void>> execute({required String idDrink}) {
    return _repository.removeFavorite(idDrink: idDrink);
  }
}
