import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:angelshare_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:angelshare_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:angelshare_app/core/providers/ui_config_provider.dart';
import 'package:angelshare_app/core/providers/view_state.dart';
import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/auth/presentation/notifier/auth_state.dart';

class AuthNotifier extends StateNotifier<ViewState<AuthState>> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final Ref _ref;

  AuthNotifier({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
    required Ref ref,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _ref = ref,
        super(const ViewState.initial(data: AuthState()));

  void toggleMode() {
    final currentData = state.data ?? const AuthState();
    final updatedData = currentData.copyWith(
      isRegisterMode: !currentData.isRegisterMode,
    );
    state = ViewState.initial(data: updatedData);
  }

  Future<void> authenticate(String email) async {
    final currentData = state.data ?? const AuthState();
    if (email.isEmpty) {
      state = ViewState.error(
        message: "Email cannot be empty",
        data: currentData,
      );
      return;
    }

    state = ViewState.loading(data: currentData);

    final DataState<void> result;
    if (currentData.isRegisterMode) {
      result = await _signUpUseCase.execute(email);
    } else {
      result = await _signInUseCase.execute(email);
    }

    await result.when(
      success: (_) async {
        try {
          // Synchronize configurations to Local state
          await _ref.read(uiConfigProvider.notifier).loadConfigs();

          // Set current user email to trigger navigation
          _ref.read(currentUserEmailProvider.notifier).state = email;

          final finalData = currentData.copyWith(
            isAuthenticated: true,
            email: email,
          );
          state = ViewState.success(data: finalData);
        } catch (e) {
          state = ViewState.error(
            message: e.toString(),
            data: currentData,
          );
        }
      },
      failure: (error) {
        state = ViewState.error(
          message: error.toString().replaceAll('Exception: ', ''),
          data: currentData,
        );
      },
    );
  }
}
