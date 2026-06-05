import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/cart/domain/repositories/cart_repository.dart';

class CheckoutUseCase {
  final CartRepository _repository;

  CheckoutUseCase({required CartRepository repository}) : _repository = repository;

  Future<DataState<void>> execute() {
    return _repository.checkout();
  }
}
