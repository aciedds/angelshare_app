// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FavoriteItemEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  DateTime get addedAt => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteItemEntityCopyWith<FavoriteItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteItemEntityCopyWith<$Res> {
  factory $FavoriteItemEntityCopyWith(
    FavoriteItemEntity value,
    $Res Function(FavoriteItemEntity) then,
  ) = _$FavoriteItemEntityCopyWithImpl<$Res, FavoriteItemEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String category,
    DateTime addedAt,
    String? thumbnailUrl,
  });
}

/// @nodoc
class _$FavoriteItemEntityCopyWithImpl<$Res, $Val extends FavoriteItemEntity>
    implements $FavoriteItemEntityCopyWith<$Res> {
  _$FavoriteItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? addedAt = null,
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
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            addedAt: null == addedAt
                ? _value.addedAt
                : addedAt // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FavoriteItemEntityImplCopyWith<$Res>
    implements $FavoriteItemEntityCopyWith<$Res> {
  factory _$$FavoriteItemEntityImplCopyWith(
    _$FavoriteItemEntityImpl value,
    $Res Function(_$FavoriteItemEntityImpl) then,
  ) = __$$FavoriteItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String category,
    DateTime addedAt,
    String? thumbnailUrl,
  });
}

/// @nodoc
class __$$FavoriteItemEntityImplCopyWithImpl<$Res>
    extends _$FavoriteItemEntityCopyWithImpl<$Res, _$FavoriteItemEntityImpl>
    implements _$$FavoriteItemEntityImplCopyWith<$Res> {
  __$$FavoriteItemEntityImplCopyWithImpl(
    _$FavoriteItemEntityImpl _value,
    $Res Function(_$FavoriteItemEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? addedAt = null,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _$FavoriteItemEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        addedAt: null == addedAt
            ? _value.addedAt
            : addedAt // ignore: cast_nullable_to_non_nullable
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

class _$FavoriteItemEntityImpl implements _FavoriteItemEntity {
  const _$FavoriteItemEntityImpl({
    required this.id,
    required this.name,
    required this.category,
    required this.addedAt,
    this.thumbnailUrl,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String category;
  @override
  final DateTime addedAt;
  @override
  final String? thumbnailUrl;

  @override
  String toString() {
    return 'FavoriteItemEntity(id: $id, name: $name, category: $category, addedAt: $addedAt, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, category, addedAt, thumbnailUrl);

  /// Create a copy of FavoriteItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteItemEntityImplCopyWith<_$FavoriteItemEntityImpl> get copyWith =>
      __$$FavoriteItemEntityImplCopyWithImpl<_$FavoriteItemEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _FavoriteItemEntity implements FavoriteItemEntity {
  const factory _FavoriteItemEntity({
    required final String id,
    required final String name,
    required final String category,
    required final DateTime addedAt,
    final String? thumbnailUrl,
  }) = _$FavoriteItemEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get category;
  @override
  DateTime get addedAt;
  @override
  String? get thumbnailUrl;

  /// Create a copy of FavoriteItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteItemEntityImplCopyWith<_$FavoriteItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
