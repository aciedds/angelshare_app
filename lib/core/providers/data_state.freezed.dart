// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DataState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Exception error) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Exception error)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Exception error)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSuccess<T> value) success,
    required TResult Function(DataFailure<T> value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSuccess<T> value)? success,
    TResult? Function(DataFailure<T> value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSuccess<T> value)? success,
    TResult Function(DataFailure<T> value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStateCopyWith<T, $Res> {
  factory $DataStateCopyWith(
    DataState<T> value,
    $Res Function(DataState<T>) then,
  ) = _$DataStateCopyWithImpl<T, $Res, DataState<T>>;
}

/// @nodoc
class _$DataStateCopyWithImpl<T, $Res, $Val extends DataState<T>>
    implements $DataStateCopyWith<T, $Res> {
  _$DataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DataSuccessImplCopyWith<T, $Res> {
  factory _$$DataSuccessImplCopyWith(
    _$DataSuccessImpl<T> value,
    $Res Function(_$DataSuccessImpl<T>) then,
  ) = __$$DataSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DataSuccessImplCopyWithImpl<T, $Res>
    extends _$DataStateCopyWithImpl<T, $Res, _$DataSuccessImpl<T>>
    implements _$$DataSuccessImplCopyWith<T, $Res> {
  __$$DataSuccessImplCopyWithImpl(
    _$DataSuccessImpl<T> _value,
    $Res Function(_$DataSuccessImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of DataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$DataSuccessImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T,
      ),
    );
  }
}

/// @nodoc

class _$DataSuccessImpl<T> implements DataSuccess<T> {
  const _$DataSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DataState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of DataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataSuccessImplCopyWith<T, _$DataSuccessImpl<T>> get copyWith =>
      __$$DataSuccessImplCopyWithImpl<T, _$DataSuccessImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Exception error) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Exception error)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Exception error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSuccess<T> value) success,
    required TResult Function(DataFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSuccess<T> value)? success,
    TResult? Function(DataFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSuccess<T> value)? success,
    TResult Function(DataFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class DataSuccess<T> implements DataState<T> {
  const factory DataSuccess(final T data) = _$DataSuccessImpl<T>;

  T get data;

  /// Create a copy of DataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataSuccessImplCopyWith<T, _$DataSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataFailureImplCopyWith<T, $Res> {
  factory _$$DataFailureImplCopyWith(
    _$DataFailureImpl<T> value,
    $Res Function(_$DataFailureImpl<T>) then,
  ) = __$$DataFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Exception error});
}

/// @nodoc
class __$$DataFailureImplCopyWithImpl<T, $Res>
    extends _$DataStateCopyWithImpl<T, $Res, _$DataFailureImpl<T>>
    implements _$$DataFailureImplCopyWith<T, $Res> {
  __$$DataFailureImplCopyWithImpl(
    _$DataFailureImpl<T> _value,
    $Res Function(_$DataFailureImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of DataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$DataFailureImpl<T>(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Exception,
      ),
    );
  }
}

/// @nodoc

class _$DataFailureImpl<T> implements DataFailure<T> {
  const _$DataFailureImpl(this.error);

  @override
  final Exception error;

  @override
  String toString() {
    return 'DataState<$T>.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataFailureImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of DataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataFailureImplCopyWith<T, _$DataFailureImpl<T>> get copyWith =>
      __$$DataFailureImplCopyWithImpl<T, _$DataFailureImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Exception error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Exception error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Exception error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSuccess<T> value) success,
    required TResult Function(DataFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSuccess<T> value)? success,
    TResult? Function(DataFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSuccess<T> value)? success,
    TResult Function(DataFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class DataFailure<T> implements DataState<T> {
  const factory DataFailure(final Exception error) = _$DataFailureImpl<T>;

  Exception get error;

  /// Create a copy of DataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataFailureImplCopyWith<T, _$DataFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
