import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state.freezed.dart';

@freezed
sealed class DataState<T> with _$DataState<T> {
  const factory DataState.success(T data) = DataSuccess<T>;
  const factory DataState.failure(Exception error) = DataFailure<T>;
}
