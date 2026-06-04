// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cocktail_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SearchCocktailRequest _$SearchCocktailRequestFromJson(
  Map<String, dynamic> json,
) {
  return _SearchCocktailRequest.fromJson(json);
}

/// @nodoc
mixin _$SearchCocktailRequest {
  String get category => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;

  /// Serializes this SearchCocktailRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchCocktailRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchCocktailRequestCopyWith<SearchCocktailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCocktailRequestCopyWith<$Res> {
  factory $SearchCocktailRequestCopyWith(
    SearchCocktailRequest value,
    $Res Function(SearchCocktailRequest) then,
  ) = _$SearchCocktailRequestCopyWithImpl<$Res, SearchCocktailRequest>;
  @useResult
  $Res call({String category, String? searchQuery});
}

/// @nodoc
class _$SearchCocktailRequestCopyWithImpl<
  $Res,
  $Val extends SearchCocktailRequest
>
    implements $SearchCocktailRequestCopyWith<$Res> {
  _$SearchCocktailRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchCocktailRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? category = null, Object? searchQuery = freezed}) {
    return _then(
      _value.copyWith(
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            searchQuery: freezed == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchCocktailRequestImplCopyWith<$Res>
    implements $SearchCocktailRequestCopyWith<$Res> {
  factory _$$SearchCocktailRequestImplCopyWith(
    _$SearchCocktailRequestImpl value,
    $Res Function(_$SearchCocktailRequestImpl) then,
  ) = __$$SearchCocktailRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, String? searchQuery});
}

/// @nodoc
class __$$SearchCocktailRequestImplCopyWithImpl<$Res>
    extends
        _$SearchCocktailRequestCopyWithImpl<$Res, _$SearchCocktailRequestImpl>
    implements _$$SearchCocktailRequestImplCopyWith<$Res> {
  __$$SearchCocktailRequestImplCopyWithImpl(
    _$SearchCocktailRequestImpl _value,
    $Res Function(_$SearchCocktailRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchCocktailRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? category = null, Object? searchQuery = freezed}) {
    return _then(
      _$SearchCocktailRequestImpl(
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        searchQuery: freezed == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchCocktailRequestImpl implements _SearchCocktailRequest {
  const _$SearchCocktailRequestImpl({required this.category, this.searchQuery});

  factory _$SearchCocktailRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchCocktailRequestImplFromJson(json);

  @override
  final String category;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'SearchCocktailRequest(category: $category, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCocktailRequestImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, searchQuery);

  /// Create a copy of SearchCocktailRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCocktailRequestImplCopyWith<_$SearchCocktailRequestImpl>
  get copyWith =>
      __$$SearchCocktailRequestImplCopyWithImpl<_$SearchCocktailRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchCocktailRequestImplToJson(this);
  }
}

abstract class _SearchCocktailRequest implements SearchCocktailRequest {
  const factory _SearchCocktailRequest({
    required final String category,
    final String? searchQuery,
  }) = _$SearchCocktailRequestImpl;

  factory _SearchCocktailRequest.fromJson(Map<String, dynamic> json) =
      _$SearchCocktailRequestImpl.fromJson;

  @override
  String get category;
  @override
  String? get searchQuery;

  /// Create a copy of SearchCocktailRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchCocktailRequestImplCopyWith<_$SearchCocktailRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
