// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alcohol_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AlcoholEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  /// Create a copy of AlcoholEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlcoholEntityCopyWith<AlcoholEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlcoholEntityCopyWith<$Res> {
  factory $AlcoholEntityCopyWith(
    AlcoholEntity value,
    $Res Function(AlcoholEntity) then,
  ) = _$AlcoholEntityCopyWithImpl<$Res, AlcoholEntity>;
  @useResult
  $Res call({String id, String name, String category, String? thumbnailUrl});
}

/// @nodoc
class _$AlcoholEntityCopyWithImpl<$Res, $Val extends AlcoholEntity>
    implements $AlcoholEntityCopyWith<$Res> {
  _$AlcoholEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlcoholEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
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
abstract class _$$AlcoholEntityImplCopyWith<$Res>
    implements $AlcoholEntityCopyWith<$Res> {
  factory _$$AlcoholEntityImplCopyWith(
    _$AlcoholEntityImpl value,
    $Res Function(_$AlcoholEntityImpl) then,
  ) = __$$AlcoholEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String category, String? thumbnailUrl});
}

/// @nodoc
class __$$AlcoholEntityImplCopyWithImpl<$Res>
    extends _$AlcoholEntityCopyWithImpl<$Res, _$AlcoholEntityImpl>
    implements _$$AlcoholEntityImplCopyWith<$Res> {
  __$$AlcoholEntityImplCopyWithImpl(
    _$AlcoholEntityImpl _value,
    $Res Function(_$AlcoholEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlcoholEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _$AlcoholEntityImpl(
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
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AlcoholEntityImpl implements _AlcoholEntity {
  const _$AlcoholEntityImpl({
    required this.id,
    required this.name,
    required this.category,
    this.thumbnailUrl,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String category;
  @override
  final String? thumbnailUrl;

  @override
  String toString() {
    return 'AlcoholEntity(id: $id, name: $name, category: $category, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlcoholEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, category, thumbnailUrl);

  /// Create a copy of AlcoholEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlcoholEntityImplCopyWith<_$AlcoholEntityImpl> get copyWith =>
      __$$AlcoholEntityImplCopyWithImpl<_$AlcoholEntityImpl>(this, _$identity);
}

abstract class _AlcoholEntity implements AlcoholEntity {
  const factory _AlcoholEntity({
    required final String id,
    required final String name,
    required final String category,
    final String? thumbnailUrl,
  }) = _$AlcoholEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get category;
  @override
  String? get thumbnailUrl;

  /// Create a copy of AlcoholEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlcoholEntityImplCopyWith<_$AlcoholEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
