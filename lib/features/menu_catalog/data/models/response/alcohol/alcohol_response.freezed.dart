// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alcohol_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AlcoholResponse _$AlcoholResponseFromJson(Map<String, dynamic> json) {
  return _AlcoholResponse.fromJson(json);
}

/// @nodoc
mixin _$AlcoholResponse {
  List<AlcoholResponseItem> get drinks => throw _privateConstructorUsedError;

  /// Serializes this AlcoholResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlcoholResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlcoholResponseCopyWith<AlcoholResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlcoholResponseCopyWith<$Res> {
  factory $AlcoholResponseCopyWith(
    AlcoholResponse value,
    $Res Function(AlcoholResponse) then,
  ) = _$AlcoholResponseCopyWithImpl<$Res, AlcoholResponse>;
  @useResult
  $Res call({List<AlcoholResponseItem> drinks});
}

/// @nodoc
class _$AlcoholResponseCopyWithImpl<$Res, $Val extends AlcoholResponse>
    implements $AlcoholResponseCopyWith<$Res> {
  _$AlcoholResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlcoholResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? drinks = null}) {
    return _then(
      _value.copyWith(
            drinks: null == drinks
                ? _value.drinks
                : drinks // ignore: cast_nullable_to_non_nullable
                      as List<AlcoholResponseItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AlcoholResponseImplCopyWith<$Res>
    implements $AlcoholResponseCopyWith<$Res> {
  factory _$$AlcoholResponseImplCopyWith(
    _$AlcoholResponseImpl value,
    $Res Function(_$AlcoholResponseImpl) then,
  ) = __$$AlcoholResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AlcoholResponseItem> drinks});
}

/// @nodoc
class __$$AlcoholResponseImplCopyWithImpl<$Res>
    extends _$AlcoholResponseCopyWithImpl<$Res, _$AlcoholResponseImpl>
    implements _$$AlcoholResponseImplCopyWith<$Res> {
  __$$AlcoholResponseImplCopyWithImpl(
    _$AlcoholResponseImpl _value,
    $Res Function(_$AlcoholResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlcoholResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? drinks = null}) {
    return _then(
      _$AlcoholResponseImpl(
        drinks: null == drinks
            ? _value._drinks
            : drinks // ignore: cast_nullable_to_non_nullable
                  as List<AlcoholResponseItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AlcoholResponseImpl implements _AlcoholResponse {
  const _$AlcoholResponseImpl({required final List<AlcoholResponseItem> drinks})
    : _drinks = drinks;

  factory _$AlcoholResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlcoholResponseImplFromJson(json);

  final List<AlcoholResponseItem> _drinks;
  @override
  List<AlcoholResponseItem> get drinks {
    if (_drinks is EqualUnmodifiableListView) return _drinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drinks);
  }

  @override
  String toString() {
    return 'AlcoholResponse(drinks: $drinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlcoholResponseImpl &&
            const DeepCollectionEquality().equals(other._drinks, _drinks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_drinks));

  /// Create a copy of AlcoholResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlcoholResponseImplCopyWith<_$AlcoholResponseImpl> get copyWith =>
      __$$AlcoholResponseImplCopyWithImpl<_$AlcoholResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AlcoholResponseImplToJson(this);
  }
}

abstract class _AlcoholResponse implements AlcoholResponse {
  const factory _AlcoholResponse({
    required final List<AlcoholResponseItem> drinks,
  }) = _$AlcoholResponseImpl;

  factory _AlcoholResponse.fromJson(Map<String, dynamic> json) =
      _$AlcoholResponseImpl.fromJson;

  @override
  List<AlcoholResponseItem> get drinks;

  /// Create a copy of AlcoholResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlcoholResponseImplCopyWith<_$AlcoholResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AlcoholResponseItem _$AlcoholResponseItemFromJson(Map<String, dynamic> json) {
  return _AlcoholResponseItem.fromJson(json);
}

/// @nodoc
mixin _$AlcoholResponseItem {
  String get idDrink => throw _privateConstructorUsedError;
  String get strDrink => throw _privateConstructorUsedError;
  String? get strDrinkThumb => throw _privateConstructorUsedError;

  /// Serializes this AlcoholResponseItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlcoholResponseItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlcoholResponseItemCopyWith<AlcoholResponseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlcoholResponseItemCopyWith<$Res> {
  factory $AlcoholResponseItemCopyWith(
    AlcoholResponseItem value,
    $Res Function(AlcoholResponseItem) then,
  ) = _$AlcoholResponseItemCopyWithImpl<$Res, AlcoholResponseItem>;
  @useResult
  $Res call({String idDrink, String strDrink, String? strDrinkThumb});
}

/// @nodoc
class _$AlcoholResponseItemCopyWithImpl<$Res, $Val extends AlcoholResponseItem>
    implements $AlcoholResponseItemCopyWith<$Res> {
  _$AlcoholResponseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlcoholResponseItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDrink = null,
    Object? strDrink = null,
    Object? strDrinkThumb = freezed,
  }) {
    return _then(
      _value.copyWith(
            idDrink: null == idDrink
                ? _value.idDrink
                : idDrink // ignore: cast_nullable_to_non_nullable
                      as String,
            strDrink: null == strDrink
                ? _value.strDrink
                : strDrink // ignore: cast_nullable_to_non_nullable
                      as String,
            strDrinkThumb: freezed == strDrinkThumb
                ? _value.strDrinkThumb
                : strDrinkThumb // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AlcoholResponseItemImplCopyWith<$Res>
    implements $AlcoholResponseItemCopyWith<$Res> {
  factory _$$AlcoholResponseItemImplCopyWith(
    _$AlcoholResponseItemImpl value,
    $Res Function(_$AlcoholResponseItemImpl) then,
  ) = __$$AlcoholResponseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idDrink, String strDrink, String? strDrinkThumb});
}

/// @nodoc
class __$$AlcoholResponseItemImplCopyWithImpl<$Res>
    extends _$AlcoholResponseItemCopyWithImpl<$Res, _$AlcoholResponseItemImpl>
    implements _$$AlcoholResponseItemImplCopyWith<$Res> {
  __$$AlcoholResponseItemImplCopyWithImpl(
    _$AlcoholResponseItemImpl _value,
    $Res Function(_$AlcoholResponseItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlcoholResponseItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDrink = null,
    Object? strDrink = null,
    Object? strDrinkThumb = freezed,
  }) {
    return _then(
      _$AlcoholResponseItemImpl(
        idDrink: null == idDrink
            ? _value.idDrink
            : idDrink // ignore: cast_nullable_to_non_nullable
                  as String,
        strDrink: null == strDrink
            ? _value.strDrink
            : strDrink // ignore: cast_nullable_to_non_nullable
                  as String,
        strDrinkThumb: freezed == strDrinkThumb
            ? _value.strDrinkThumb
            : strDrinkThumb // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AlcoholResponseItemImpl implements _AlcoholResponseItem {
  const _$AlcoholResponseItemImpl({
    required this.idDrink,
    required this.strDrink,
    this.strDrinkThumb,
  });

  factory _$AlcoholResponseItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlcoholResponseItemImplFromJson(json);

  @override
  final String idDrink;
  @override
  final String strDrink;
  @override
  final String? strDrinkThumb;

  @override
  String toString() {
    return 'AlcoholResponseItem(idDrink: $idDrink, strDrink: $strDrink, strDrinkThumb: $strDrinkThumb)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlcoholResponseItemImpl &&
            (identical(other.idDrink, idDrink) || other.idDrink == idDrink) &&
            (identical(other.strDrink, strDrink) ||
                other.strDrink == strDrink) &&
            (identical(other.strDrinkThumb, strDrinkThumb) ||
                other.strDrinkThumb == strDrinkThumb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idDrink, strDrink, strDrinkThumb);

  /// Create a copy of AlcoholResponseItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlcoholResponseItemImplCopyWith<_$AlcoholResponseItemImpl> get copyWith =>
      __$$AlcoholResponseItemImplCopyWithImpl<_$AlcoholResponseItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AlcoholResponseItemImplToJson(this);
  }
}

abstract class _AlcoholResponseItem implements AlcoholResponseItem {
  const factory _AlcoholResponseItem({
    required final String idDrink,
    required final String strDrink,
    final String? strDrinkThumb,
  }) = _$AlcoholResponseItemImpl;

  factory _AlcoholResponseItem.fromJson(Map<String, dynamic> json) =
      _$AlcoholResponseItemImpl.fromJson;

  @override
  String get idDrink;
  @override
  String get strDrink;
  @override
  String? get strDrinkThumb;

  /// Create a copy of AlcoholResponseItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlcoholResponseItemImplCopyWith<_$AlcoholResponseItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
