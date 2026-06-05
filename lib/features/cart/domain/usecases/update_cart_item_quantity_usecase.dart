import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/cart/domain/repositories/cart_repository.dart';

class UpdateCartItemQuantityUseCase {
  final CartRepository _repository;

  UpdateCartItemQuantityUseCase({required CartRepository repository}) : _repository = repository;

  Future<DataState<void>> execute({
    required String idDrink,
    required int quantity,
  }) {
    return _repository.updateCartItemQuantity(
      idDrink: idDrink,
      quantity: quantity,
    );
  }
}
