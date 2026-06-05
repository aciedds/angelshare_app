import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/favorites/domain/repositories/favorites_repository.dart';

class CheckIsFavoriteUseCase {
  final FavoritesRepository _repository;

  CheckIsFavoriteUseCase({required FavoritesRepository repository}) : _repository = repository;

  Future<DataState<bool>> execute({required String idDrink}) {
    return _repository.isFavorite(idDrink: idDrink);
  }
}
