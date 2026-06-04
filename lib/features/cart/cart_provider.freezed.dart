// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CartState {
  List<CartItemEntity> get cartItems => throw _privateConstructorUsedError;
  List<OrderHistoryEntity> get orderHistory =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call({
    List<CartItemEntity> cartItems,
    List<OrderHistoryEntity> orderHistory,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? orderHistory = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            cartItems: null == cartItems
                ? _value.cartItems
                : cartItems // ignore: cast_nullable_to_non_nullable
                      as List<CartItemEntity>,
            orderHistory: null == orderHistory
                ? _value.orderHistory
                : orderHistory // ignore: cast_nullable_to_non_nullable
                      as List<OrderHistoryEntity>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
    _$CartStateImpl value,
    $Res Function(_$CartStateImpl) then,
  ) = __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<CartItemEntity> cartItems,
    List<OrderHistoryEntity> orderHistory,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
    _$CartStateImpl _value,
    $Res Function(_$CartStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? orderHistory = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$CartStateImpl(
        cartItems: null == cartItems
            ? _value._cartItems
            : cartItems // ignore: cast_nullable_to_non_nullable
                  as List<CartItemEntity>,
        orderHistory: null == orderHistory
            ? _value._orderHistory
            : orderHistory // ignore: cast_nullable_to_non_nullable
                  as List<OrderHistoryEntity>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CartStateImpl implements _CartState {
  const _$CartStateImpl({
    final List<CartItemEntity> cartItems = const [],
    final List<OrderHistoryEntity> orderHistory = const [],
    this.isLoading = false,
    this.errorMessage,
  }) : _cartItems = cartItems,
       _orderHistory = orderHistory;

  final List<CartItemEntity> _cartItems;
  @override
  @JsonKey()
  List<CartItemEntity> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  final List<OrderHistoryEntity> _orderHistory;
  @override
  @JsonKey()
  List<OrderHistoryEntity> get orderHistory {
    if (_orderHistory is EqualUnmodifiableListView) return _orderHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistory);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CartState(cartItems: $cartItems, orderHistory: $orderHistory, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            const DeepCollectionEquality().equals(
              other._cartItems,
              _cartItems,
            ) &&
            const DeepCollectionEquality().equals(
              other._orderHistory,
              _orderHistory,
            ) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_cartItems),
    const DeepCollectionEquality().hash(_orderHistory),
    isLoading,
    errorMessage,
  );

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState({
    final List<CartItemEntity> cartItems,
    final List<OrderHistoryEntity> orderHistory,
    final bool isLoading,
    final String? errorMessage,
  }) = _$CartStateImpl;

  @override
  List<CartItemEntity> get cartItems;
  @override
  List<OrderHistoryEntity> get orderHistory;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
