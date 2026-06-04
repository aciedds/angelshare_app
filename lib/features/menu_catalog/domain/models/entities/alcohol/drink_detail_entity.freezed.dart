// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drink_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DrinkDetailEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get glass => throw _privateConstructorUsedError;
  String get alcoholic => throw _privateConstructorUsedError;
  String get instructions => throw _privateConstructorUsedError;
  List<IngredientEntity> get ingredients => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  /// Create a copy of DrinkDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrinkDetailEntityCopyWith<DrinkDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrinkDetailEntityCopyWith<$Res> {
  factory $DrinkDetailEntityCopyWith(
    DrinkDetailEntity value,
    $Res Function(DrinkDetailEntity) then,
  ) = _$DrinkDetailEntityCopyWithImpl<$Res, DrinkDetailEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String category,
    String glass,
    String alcoholic,
    String instructions,
    List<IngredientEntity> ingredients,
    String? thumbnailUrl,
  });
}

/// @nodoc
class _$DrinkDetailEntityCopyWithImpl<$Res, $Val extends DrinkDetailEntity>
    implements $DrinkDetailEntityCopyWith<$Res> {
  _$DrinkDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DrinkDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? glass = null,
    Object? alcoholic = null,
    Object? instructions = null,
    Object? ingredients = null,
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
            glass: null == glass
                ? _value.glass
                : glass // ignore: cast_nullable_to_non_nullable
                      as String,
            alcoholic: null == alcoholic
                ? _value.alcoholic
                : alcoholic // ignore: cast_nullable_to_non_nullable
                      as String,
            instructions: null == instructions
                ? _value.instructions
                : instructions // ignore: cast_nullable_to_non_nullable
                      as String,
            ingredients: null == ingredients
                ? _value.ingredients
                : ingredients // ignore: cast_nullable_to_non_nullable
                      as List<IngredientEntity>,
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
abstract class _$$DrinkDetailEntityImplCopyWith<$Res>
    implements $DrinkDetailEntityCopyWith<$Res> {
  factory _$$DrinkDetailEntityImplCopyWith(
    _$DrinkDetailEntityImpl value,
    $Res Function(_$DrinkDetailEntityImpl) then,
  ) = __$$DrinkDetailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String category,
    String glass,
    String alcoholic,
    String instructions,
    List<IngredientEntity> ingredients,
    String? thumbnailUrl,
  });
}

/// @nodoc
class __$$DrinkDetailEntityImplCopyWithImpl<$Res>
    extends _$DrinkDetailEntityCopyWithImpl<$Res, _$DrinkDetailEntityImpl>
    implements _$$DrinkDetailEntityImplCopyWith<$Res> {
  __$$DrinkDetailEntityImplCopyWithImpl(
    _$DrinkDetailEntityImpl _value,
    $Res Function(_$DrinkDetailEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DrinkDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? glass = null,
    Object? alcoholic = null,
    Object? instructions = null,
    Object? ingredients = null,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _$DrinkDetailEntityImpl(
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
        glass: null == glass
            ? _value.glass
            : glass // ignore: cast_nullable_to_non_nullable
                  as String,
        alcoholic: null == alcoholic
            ? _value.alcoholic
            : alcoholic // ignore: cast_nullable_to_non_nullable
                  as String,
        instructions: null == instructions
            ? _value.instructions
            : instructions // ignore: cast_nullable_to_non_nullable
                  as String,
        ingredients: null == ingredients
            ? _value._ingredients
            : ingredients // ignore: cast_nullable_to_non_nullable
                  as List<IngredientEntity>,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DrinkDetailEntityImpl implements _DrinkDetailEntity {
  const _$DrinkDetailEntityImpl({
    required this.id,
    required this.name,
    required this.category,
    required this.glass,
    required this.alcoholic,
    required this.instructions,
    required final List<IngredientEntity> ingredients,
    this.thumbnailUrl,
  }) : _ingredients = ingredients;

  @override
  final String id;
  @override
  final String name;
  @override
  final String category;
  @override
  final String glass;
  @override
  final String alcoholic;
  @override
  final String instructions;
  final List<IngredientEntity> _ingredients;
  @override
  List<IngredientEntity> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final String? thumbnailUrl;

  @override
  String toString() {
    return 'DrinkDetailEntity(id: $id, name: $name, category: $category, glass: $glass, alcoholic: $alcoholic, instructions: $instructions, ingredients: $ingredients, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrinkDetailEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.glass, glass) || other.glass == glass) &&
            (identical(other.alcoholic, alcoholic) ||
                other.alcoholic == alcoholic) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            const DeepCollectionEquality().equals(
              other._ingredients,
              _ingredients,
            ) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    category,
    glass,
    alcoholic,
    instructions,
    const DeepCollectionEquality().hash(_ingredients),
    thumbnailUrl,
  );

  /// Create a copy of DrinkDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrinkDetailEntityImplCopyWith<_$DrinkDetailEntityImpl> get copyWith =>
      __$$DrinkDetailEntityImplCopyWithImpl<_$DrinkDetailEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _DrinkDetailEntity implements DrinkDetailEntity {
  const factory _DrinkDetailEntity({
    required final String id,
    required final String name,
    required final String category,
    required final String glass,
    required final String alcoholic,
    required final String instructions,
    required final List<IngredientEntity> ingredients,
    final String? thumbnailUrl,
  }) = _$DrinkDetailEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get category;
  @override
  String get glass;
  @override
  String get alcoholic;
  @override
  String get instructions;
  @override
  List<IngredientEntity> get ingredients;
  @override
  String? get thumbnailUrl;

  /// Create a copy of DrinkDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrinkDetailEntityImplCopyWith<_$DrinkDetailEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IngredientEntity {
  String get name => throw _privateConstructorUsedError;
  String get measure => throw _privateConstructorUsedError;

  /// Create a copy of IngredientEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientEntityCopyWith<IngredientEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientEntityCopyWith<$Res> {
  factory $IngredientEntityCopyWith(
    IngredientEntity value,
    $Res Function(IngredientEntity) then,
  ) = _$IngredientEntityCopyWithImpl<$Res, IngredientEntity>;
  @useResult
  $Res call({String name, String measure});
}

/// @nodoc
class _$IngredientEntityCopyWithImpl<$Res, $Val extends IngredientEntity>
    implements $IngredientEntityCopyWith<$Res> {
  _$IngredientEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? measure = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            measure: null == measure
                ? _value.measure
                : measure // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IngredientEntityImplCopyWith<$Res>
    implements $IngredientEntityCopyWith<$Res> {
  factory _$$IngredientEntityImplCopyWith(
    _$IngredientEntityImpl value,
    $Res Function(_$IngredientEntityImpl) then,
  ) = __$$IngredientEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String measure});
}

/// @nodoc
class __$$IngredientEntityImplCopyWithImpl<$Res>
    extends _$IngredientEntityCopyWithImpl<$Res, _$IngredientEntityImpl>
    implements _$$IngredientEntityImplCopyWith<$Res> {
  __$$IngredientEntityImplCopyWithImpl(
    _$IngredientEntityImpl _value,
    $Res Function(_$IngredientEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IngredientEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? measure = null}) {
    return _then(
      _$IngredientEntityImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        measure: null == measure
            ? _value.measure
            : measure // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$IngredientEntityImpl implements _IngredientEntity {
  const _$IngredientEntityImpl({required this.name, required this.measure});

  @override
  final String name;
  @override
  final String measure;

  @override
  String toString() {
    return 'IngredientEntity(name: $name, measure: $measure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.measure, measure) || other.measure == measure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, measure);

  /// Create a copy of IngredientEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientEntityImplCopyWith<_$IngredientEntityImpl> get copyWith =>
      __$$IngredientEntityImplCopyWithImpl<_$IngredientEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _IngredientEntity implements IngredientEntity {
  const factory _IngredientEntity({
    required final String name,
    required final String measure,
  }) = _$IngredientEntityImpl;

  @override
  String get name;
  @override
  String get measure;

  /// Create a copy of IngredientEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientEntityImplCopyWith<_$IngredientEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
