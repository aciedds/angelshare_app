import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/cart/domain/models/entities/cart_item_entity.dart';
import 'package:angelshare_app/features/cart/domain/repositories/cart_repository.dart';

class GetCartItemsUseCase {
  final CartRepository _repository;

  GetCartItemsUseCase({required CartRepository repository}) : _repository = repository;

  Future<DataState<List<CartItemEntity>>> execute() {
    return _repository.getCartItems();
  }
}
