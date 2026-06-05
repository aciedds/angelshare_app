import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/cart/domain/models/entities/cart_item_entity.dart';
import 'package:angelshare_app/features/cart/domain/repositories/cart_repository.dart';

class GetOrderHistoryUseCase {
  final CartRepository _repository;

  GetOrderHistoryUseCase({required CartRepository repository}) : _repository = repository;

  Future<DataState<List<OrderHistoryEntity>>> execute() {
    return _repository.getOrderHistory();
  }
}
