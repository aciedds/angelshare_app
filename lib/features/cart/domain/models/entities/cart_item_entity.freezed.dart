// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CartItemEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemEntityCopyWith<CartItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemEntityCopyWith<$Res> {
  factory $CartItemEntityCopyWith(
    CartItemEntity value,
    $Res Function(CartItemEntity) then,
  ) = _$CartItemEntityCopyWithImpl<$Res, CartItemEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    int quantity,
    int price,
    String? thumbnailUrl,
  });
}

/// @nodoc
class _$CartItemEntityCopyWithImpl<$Res, $Val extends CartItemEntity>
    implements $CartItemEntityCopyWith<$Res> {
  _$CartItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? price = null,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as int,
            thumbnailUrl: freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartItemEntityImplCopyWith<$Res>
    implements $CartItemEntityCopyWith<$Res> {
  factory _$$CartItemEntityImplCopyWith(
    _$CartItemEntityImpl value,
    $Res Function(_$CartItemEntityImpl) then,
  ) = __$$CartItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    int quantity,
    int price,
    String? thumbnailUrl,
  });
}

/// @nodoc
class __$$CartItemEntityImplCopyWithImpl<$Res>
    extends _$CartItemEntityCopyWithImpl<$Res, _$CartItemEntityImpl>
    implements _$$CartItemEntityImplCopyWith<$Res> {
  __$$CartItemEntityImplCopyWithImpl(
    _$CartItemEntityImpl _value,
    $Res Function(_$CartItemEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? price = null,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _$CartItemEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as int,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CartItemEntityImpl implements _CartItemEntity {
  const _$CartItemEntityImpl({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    this.thumbnailUrl,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final int quantity;
  @override
  final int price;
  @override
  final String? thumbnailUrl;

  @override
  String toString() {
    return 'CartItemEntity(id: $id, name: $name, quantity: $quantity, price: $price, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, quantity, price, thumbnailUrl);

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemEntityImplCopyWith<_$CartItemEntityImpl> get copyWith =>
      __$$CartItemEntityImplCopyWithImpl<_$CartItemEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _CartItemEntity implements CartItemEntity {
  const factory _CartItemEntity({
    required final String id,
    required final String name,
    required final int quantity,
    required final int price,
    final String? thumbnailUrl,
  }) = _$CartItemEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  int get quantity;
  @override
  int get price;
  @override
  String? get thumbnailUrl;

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemEntityImplCopyWith<_$CartItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderHistoryEntity {
  int get id => throw _privateConstructorUsedError;
  String get idDrink => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  DateTime get orderedAt => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  /// Create a copy of OrderHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderHistoryEntityCopyWith<OrderHistoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryEntityCopyWith<$Res> {
  factory $OrderHistoryEntityCopyWith(
    OrderHistoryEntity value,
    $Res Function(OrderHistoryEntity) then,
  ) = _$OrderHistoryEntityCopyWithImpl<$Res, OrderHistoryEntity>;
  @useResult
  $Res call({
    int id,
    String idDrink,
    String name,
    int quantity,
    DateTime orderedAt,
    String? thumbnailUrl,
  });
}

/// @nodoc
class _$OrderHistoryEntityCopyWithImpl<$Res, $Val extends OrderHistoryEntity>
    implements $OrderHistoryEntityCopyWith<$Res> {
  _$OrderHistoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idDrink = null,
    Object? name = null,
    Object? quantity = null,
    Object? orderedAt = null,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            idDrink: null == idDrink
                ? _value.idDrink
                : idDrink // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            orderedAt: null == orderedAt
                ? _value.orderedAt
                : orderedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            thumbnailUrl: freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderHistoryEntityImplCopyWith<$Res>
    implements $OrderHistoryEntityCopyWith<$Res> {
  factory _$$OrderHistoryEntityImplCopyWith(
    _$OrderHistoryEntityImpl value,
    $Res Function(_$OrderHistoryEntityImpl) then,
  ) = __$$OrderHistoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String idDrink,
    String name,
    int quantity,
    DateTime orderedAt,
    String? thumbnailUrl,
  });
}

/// @nodoc
class __$$OrderHistoryEntityImplCopyWithImpl<$Res>
    extends _$OrderHistoryEntityCopyWithImpl<$Res, _$OrderHistoryEntityImpl>
    implements _$$OrderHistoryEntityImplCopyWith<$Res> {
  __$$OrderHistoryEntityImplCopyWithImpl(
    _$OrderHistoryEntityImpl _value,
    $Res Function(_$OrderHistoryEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idDrink = null,
    Object? name = null,
    Object? quantity = null,
    Object? orderedAt = null,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _$OrderHistoryEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        idDrink: null == idDrink
            ? _value.idDrink
            : idDrink // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        orderedAt: null == orderedAt
            ? _value.orderedAt
            : orderedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OrderHistoryEntityImpl implements _OrderHistoryEntity {
  const _$OrderHistoryEntityImpl({
    required this.id,
    required this.idDrink,
    required this.name,
    required this.quantity,
    required this.orderedAt,
    this.thumbnailUrl,
  });

  @override
  final int id;
  @override
  final String idDrink;
  @override
  final String name;
  @override
  final int quantity;
  @override
  final DateTime orderedAt;
  @override
  final String? thumbnailUrl;

  @override
  String toString() {
    return 'OrderHistoryEntity(id: $id, idDrink: $idDrink, name: $name, quantity: $quantity, orderedAt: $orderedAt, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idDrink, idDrink) || other.idDrink == idDrink) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.orderedAt, orderedAt) ||
                other.orderedAt == orderedAt) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    idDrink,
    name,
    quantity,
    orderedAt,
    thumbnailUrl,
  );

  /// Create a copy of OrderHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryEntityImplCopyWith<_$OrderHistoryEntityImpl> get copyWith =>
      __$$OrderHistoryEntityImplCopyWithImpl<_$OrderHistoryEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _OrderHistoryEntity implements OrderHistoryEntity {
  const factory _OrderHistoryEntity({
    required final int id,
    required final String idDrink,
    required final String name,
    required final int quantity,
    required final DateTime orderedAt,
    final String? thumbnailUrl,
  }) = _$OrderHistoryEntityImpl;

  @override
  int get id;
  @override
  String get idDrink;
  @override
  String get name;
  @override
  int get quantity;
  @override
  DateTime get orderedAt;
  @override
  String? get thumbnailUrl;

  /// Create a copy of OrderHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderHistoryEntityImplCopyWith<_$OrderHistoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
