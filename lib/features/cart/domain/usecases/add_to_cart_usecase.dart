import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/cart/domain/repositories/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository _repository;

  AddToCartUseCase({required CartRepository repository}) : _repository = repository;

  Future<DataState<void>> execute({
    required String idDrink,
    required String name,
    required int quantity,
    required int price,
    String? thumbnailUrl,
  }) {
    return _repository.addToCart(
      idDrink: idDrink,
      name: name,
      quantity: quantity,
      price: price,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
