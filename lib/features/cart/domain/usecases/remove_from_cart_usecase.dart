import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/cart/domain/repositories/cart_repository.dart';

class RemoveFromCartUseCase {
  final CartRepository _repository;

  RemoveFromCartUseCase({required CartRepository repository}) : _repository = repository;

  Future<DataState<void>> execute({required String idDrink}) {
    return _repository.removeFromCart(idDrink: idDrink);
  }
}
