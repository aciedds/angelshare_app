import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_state.freezed.dart';

@freezed
sealed class ViewState<T> with _$ViewState<T> {
  const factory ViewState.initial({T? data}) = ViewStateInitial<T>;
  const factory ViewState.loading({T? data}) = ViewStateLoading<T>;
  const factory ViewState.success({required T data}) = ViewStateSuccess<T>;
  const factory ViewState.error({required String message, T? data}) = ViewStateError<T>;
}
