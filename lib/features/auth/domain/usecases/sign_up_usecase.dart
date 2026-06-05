import 'package:angelshare_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:angelshare_app/core/providers/data_state.dart';

class SignUpUseCase {
  final AuthRepository _repository;

  SignUpUseCase({required AuthRepository repository}) : _repository = repository;

  Future<DataState<void>> execute(String email) {
    return _repository.signUp(email);
  }
}
