import 'package:angelshare_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:angelshare_app/core/providers/data_state.dart';

class SignInUseCase {
  final AuthRepository _repository;

  SignInUseCase({required AuthRepository repository}) : _repository = repository;

  Future<DataState<void>> execute(String email) {
    return _repository.signIn(email);
  }
}
