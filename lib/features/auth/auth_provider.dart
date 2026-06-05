import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:angelshare_app/core/providers/ui_config_provider.dart';
import 'package:angelshare_app/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:angelshare_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:angelshare_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:angelshare_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:angelshare_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:angelshare_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:angelshare_app/features/auth/presentation/notifier/auth_state.dart';
import 'package:angelshare_app/core/providers/view_state.dart';

// Remote Data Source Provider
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource();
});

// Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = ref.watch(authRemoteDataSourceProvider);
  final localDao = ref.watch(uiWidgetDaoProvider);
  return AuthRepositoryImpl(remoteDataSource: remote, uiWidgetDao: localDao);
});

// UseCase Providers
final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInUseCase(repository: repository);
});

final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignUpUseCase(repository: repository);
});

// StateNotifier Provider for Authentication
final authNotifierProvider = StateNotifierProvider<AuthNotifier, ViewState<AuthState>>((ref) {
  final signInUseCase = ref.watch(signInUseCaseProvider);
  final signUpUseCase = ref.watch(signUpUseCaseProvider);
  return AuthNotifier(
    signInUseCase: signInUseCase,
    signUpUseCase: signUpUseCase,
    ref: ref,
  );
});
