import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isRegisterMode,
    @Default(false) bool isAuthenticated,
    String? email,
  }) = _AuthState;
}
