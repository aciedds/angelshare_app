import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/favorites/domain/repositories/favorites_repository.dart';

class AddFavoriteUseCase {
  final FavoritesRepository _repository;

  AddFavoriteUseCase({required FavoritesRepository repository}) : _repository = repository;

  Future<DataState<void>> execute({
    required String idDrink,
    required String name,
    required String category,
    String? thumbnailUrl,
  }) {
    return _repository.addFavorite(
      idDrink: idDrink,
      name: name,
      category: category,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
