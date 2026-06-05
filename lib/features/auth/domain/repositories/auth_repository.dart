import 'package:angelshare_app/core/providers/data_state.dart';

abstract class AuthRepository {
  Future<DataState<void>> signIn(String email);
  Future<DataState<void>> signUp(String email);
}
