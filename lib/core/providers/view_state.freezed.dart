// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ViewState<T> {
  T? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) initial,
    required TResult Function(T? data) loading,
    required TResult Function(T data) success,
    required TResult Function(String message, T? data) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? initial,
    TResult? Function(T? data)? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, T? data)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? initial,
    TResult Function(T? data)? loading,
    TResult Function(T data)? success,
    TResult Function(String message, T? data)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewStateInitial<T> value) initial,
    required TResult Function(ViewStateLoading<T> value) loading,
    required TResult Function(ViewStateSuccess<T> value) success,
    required TResult Function(ViewStateError<T> value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ViewStateInitial<T> value)? initial,
    TResult? Function(ViewStateLoading<T> value)? loading,
    TResult? Function(ViewStateSuccess<T> value)? success,
    TResult? Function(ViewStateError<T> value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewStateInitial<T> value)? initial,
    TResult Function(ViewStateLoading<T> value)? loading,
    TResult Function(ViewStateSuccess<T> value)? success,
    TResult Function(ViewStateError<T> value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewStateCopyWith<T, $Res> {
  factory $ViewStateCopyWith(
    ViewState<T> value,
    $Res Function(ViewState<T>) then,
  ) = _$ViewStateCopyWithImpl<T, $Res, ViewState<T>>;
}

/// @nodoc
class _$ViewStateCopyWithImpl<T, $Res, $Val extends ViewState<T>>
    implements $ViewStateCopyWith<T, $Res> {
  _$ViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ViewStateInitialImplCopyWith<T, $Res> {
  factory _$$ViewStateInitialImplCopyWith(
    _$ViewStateInitialImpl<T> value,
    $Res Function(_$ViewStateInitialImpl<T>) then,
  ) = __$$ViewStateInitialImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$ViewStateInitialImplCopyWithImpl<T, $Res>
    extends _$ViewStateCopyWithImpl<T, $Res, _$ViewStateInitialImpl<T>>
    implements _$$ViewStateInitialImplCopyWith<T, $Res> {
  __$$ViewStateInitialImplCopyWithImpl(
    _$ViewStateInitialImpl<T> _value,
    $Res Function(_$ViewStateInitialImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$ViewStateInitialImpl<T>(
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T?,
      ),
    );
  }
}

/// @nodoc

class _$ViewStateInitialImpl<T> implements ViewStateInitial<T> {
  const _$ViewStateInitialImpl({this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'ViewState<$T>.initial(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewStateInitialImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewStateInitialImplCopyWith<T, _$ViewStateInitialImpl<T>> get copyWith =>
      __$$ViewStateInitialImplCopyWithImpl<T, _$ViewStateInitialImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) initial,
    required TResult Function(T? data) loading,
    required TResult Function(T data) success,
    required TResult Function(String message, T? data) error,
  }) {
    return initial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? initial,
    TResult? Function(T? data)? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, T? data)? error,
  }) {
    return initial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? initial,
    TResult Function(T? data)? loading,
    TResult Function(T data)? success,
    TResult Function(String message, T? data)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewStateInitial<T> value) initial,
    required TResult Function(ViewStateLoading<T> value) loading,
    required TResult Function(ViewStateSuccess<T> value) success,
    required TResult Function(ViewStateError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ViewStateInitial<T> value)? initial,
    TResult? Function(ViewStateLoading<T> value)? loading,
    TResult? Function(ViewStateSuccess<T> value)? success,
    TResult? Function(ViewStateError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewStateInitial<T> value)? initial,
    TResult Function(ViewStateLoading<T> value)? loading,
    TResult Function(ViewStateSuccess<T> value)? success,
    TResult Function(ViewStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ViewStateInitial<T> implements ViewState<T> {
  const factory ViewStateInitial({final T? data}) = _$ViewStateInitialImpl<T>;

  @override
  T? get data;

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewStateInitialImplCopyWith<T, _$ViewStateInitialImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ViewStateLoadingImplCopyWith<T, $Res> {
  factory _$$ViewStateLoadingImplCopyWith(
    _$ViewStateLoadingImpl<T> value,
    $Res Function(_$ViewStateLoadingImpl<T>) then,
  ) = __$$ViewStateLoadingImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$ViewStateLoadingImplCopyWithImpl<T, $Res>
    extends _$ViewStateCopyWithImpl<T, $Res, _$ViewStateLoadingImpl<T>>
    implements _$$ViewStateLoadingImplCopyWith<T, $Res> {
  __$$ViewStateLoadingImplCopyWithImpl(
    _$ViewStateLoadingImpl<T> _value,
    $Res Function(_$ViewStateLoadingImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$ViewStateLoadingImpl<T>(
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T?,
      ),
    );
  }
}

/// @nodoc

class _$ViewStateLoadingImpl<T> implements ViewStateLoading<T> {
  const _$ViewStateLoadingImpl({this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'ViewState<$T>.loading(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewStateLoadingImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewStateLoadingImplCopyWith<T, _$ViewStateLoadingImpl<T>> get copyWith =>
      __$$ViewStateLoadingImplCopyWithImpl<T, _$ViewStateLoadingImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) initial,
    required TResult Function(T? data) loading,
    required TResult Function(T data) success,
    required TResult Function(String message, T? data) error,
  }) {
    return loading(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? initial,
    TResult? Function(T? data)? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, T? data)? error,
  }) {
    return loading?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? initial,
    TResult Function(T? data)? loading,
    TResult Function(T data)? success,
    TResult Function(String message, T? data)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewStateInitial<T> value) initial,
    required TResult Function(ViewStateLoading<T> value) loading,
    required TResult Function(ViewStateSuccess<T> value) success,
    required TResult Function(ViewStateError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ViewStateInitial<T> value)? initial,
    TResult? Function(ViewStateLoading<T> value)? loading,
    TResult? Function(ViewStateSuccess<T> value)? success,
    TResult? Function(ViewStateError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewStateInitial<T> value)? initial,
    TResult Function(ViewStateLoading<T> value)? loading,
    TResult Function(ViewStateSuccess<T> value)? success,
    TResult Function(ViewStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ViewStateLoading<T> implements ViewState<T> {
  const factory ViewStateLoading({final T? data}) = _$ViewStateLoadingImpl<T>;

  @override
  T? get data;

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewStateLoadingImplCopyWith<T, _$ViewStateLoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ViewStateSuccessImplCopyWith<T, $Res> {
  factory _$$ViewStateSuccessImplCopyWith(
    _$ViewStateSuccessImpl<T> value,
    $Res Function(_$ViewStateSuccessImpl<T>) then,
  ) = __$$ViewStateSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ViewStateSuccessImplCopyWithImpl<T, $Res>
    extends _$ViewStateCopyWithImpl<T, $Res, _$ViewStateSuccessImpl<T>>
    implements _$$ViewStateSuccessImplCopyWith<T, $Res> {
  __$$ViewStateSuccessImplCopyWithImpl(
    _$ViewStateSuccessImpl<T> _value,
    $Res Function(_$ViewStateSuccessImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$ViewStateSuccessImpl<T>(
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T,
      ),
    );
  }
}

/// @nodoc

class _$ViewStateSuccessImpl<T> implements ViewStateSuccess<T> {
  const _$ViewStateSuccessImpl({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'ViewState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewStateSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewStateSuccessImplCopyWith<T, _$ViewStateSuccessImpl<T>> get copyWith =>
      __$$ViewStateSuccessImplCopyWithImpl<T, _$ViewStateSuccessImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) initial,
    required TResult Function(T? data) loading,
    required TResult Function(T data) success,
    required TResult Function(String message, T? data) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? initial,
    TResult? Function(T? data)? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, T? data)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? initial,
    TResult Function(T? data)? loading,
    TResult Function(T data)? success,
    TResult Function(String message, T? data)? error,
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
    required TResult Function(ViewStateInitial<T> value) initial,
    required TResult Function(ViewStateLoading<T> value) loading,
    required TResult Function(ViewStateSuccess<T> value) success,
    required TResult Function(ViewStateError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ViewStateInitial<T> value)? initial,
    TResult? Function(ViewStateLoading<T> value)? loading,
    TResult? Function(ViewStateSuccess<T> value)? success,
    TResult? Function(ViewStateError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewStateInitial<T> value)? initial,
    TResult Function(ViewStateLoading<T> value)? loading,
    TResult Function(ViewStateSuccess<T> value)? success,
    TResult Function(ViewStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ViewStateSuccess<T> implements ViewState<T> {
  const factory ViewStateSuccess({required final T data}) =
      _$ViewStateSuccessImpl<T>;

  @override
  T get data;

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewStateSuccessImplCopyWith<T, _$ViewStateSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ViewStateErrorImplCopyWith<T, $Res> {
  factory _$$ViewStateErrorImplCopyWith(
    _$ViewStateErrorImpl<T> value,
    $Res Function(_$ViewStateErrorImpl<T>) then,
  ) = __$$ViewStateErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, T? data});
}

/// @nodoc
class __$$ViewStateErrorImplCopyWithImpl<T, $Res>
    extends _$ViewStateCopyWithImpl<T, $Res, _$ViewStateErrorImpl<T>>
    implements _$$ViewStateErrorImplCopyWith<T, $Res> {
  __$$ViewStateErrorImplCopyWithImpl(
    _$ViewStateErrorImpl<T> _value,
    $Res Function(_$ViewStateErrorImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? data = freezed}) {
    return _then(
      _$ViewStateErrorImpl<T>(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T?,
      ),
    );
  }
}

/// @nodoc

class _$ViewStateErrorImpl<T> implements ViewStateError<T> {
  const _$ViewStateErrorImpl({required this.message, this.data});

  @override
  final String message;
  @override
  final T? data;

  @override
  String toString() {
    return 'ViewState<$T>.error(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewStateErrorImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(data),
  );

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewStateErrorImplCopyWith<T, _$ViewStateErrorImpl<T>> get copyWith =>
      __$$ViewStateErrorImplCopyWithImpl<T, _$ViewStateErrorImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) initial,
    required TResult Function(T? data) loading,
    required TResult Function(T data) success,
    required TResult Function(String message, T? data) error,
  }) {
    return error(message, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? initial,
    TResult? Function(T? data)? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, T? data)? error,
  }) {
    return error?.call(message, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? initial,
    TResult Function(T? data)? loading,
    TResult Function(T data)? success,
    TResult Function(String message, T? data)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewStateInitial<T> value) initial,
    required TResult Function(ViewStateLoading<T> value) loading,
    required TResult Function(ViewStateSuccess<T> value) success,
    required TResult Function(ViewStateError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ViewStateInitial<T> value)? initial,
    TResult? Function(ViewStateLoading<T> value)? loading,
    TResult? Function(ViewStateSuccess<T> value)? success,
    TResult? Function(ViewStateError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewStateInitial<T> value)? initial,
    TResult Function(ViewStateLoading<T> value)? loading,
    TResult Function(ViewStateSuccess<T> value)? success,
    TResult Function(ViewStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ViewStateError<T> implements ViewState<T> {
  const factory ViewStateError({required final String message, final T? data}) =
      _$ViewStateErrorImpl<T>;

  String get message;
  @override
  T? get data;

  /// Create a copy of ViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewStateErrorImplCopyWith<T, _$ViewStateErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
