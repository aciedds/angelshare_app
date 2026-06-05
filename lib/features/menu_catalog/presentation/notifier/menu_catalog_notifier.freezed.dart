// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_catalog_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MenuCatalogState {
  List<String> get categories => throw _privateConstructorUsedError;
  String get selectedCategory => throw _privateConstructorUsedError;
  List<AlcoholEntity> get cocktails => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  int get activeTab => throw _privateConstructorUsedError;
  bool get isLoadingDetail => throw _privateConstructorUsedError;
  bool get isSynthesizing => throw _privateConstructorUsedError;
  DrinkDetailEntity? get selectedDrinkDetail =>
      throw _privateConstructorUsedError;
  DrinkDetailEntity? get randomDrinkDetail =>
      throw _privateConstructorUsedError;

  /// Create a copy of MenuCatalogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuCatalogStateCopyWith<MenuCatalogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCatalogStateCopyWith<$Res> {
  factory $MenuCatalogStateCopyWith(
    MenuCatalogState value,
    $Res Function(MenuCatalogState) then,
  ) = _$MenuCatalogStateCopyWithImpl<$Res, MenuCatalogState>;
  @useResult
  $Res call({
    List<String> categories,
    String selectedCategory,
    List<AlcoholEntity> cocktails,
    String searchQuery,
    int activeTab,
    bool isLoadingDetail,
    bool isSynthesizing,
    DrinkDetailEntity? selectedDrinkDetail,
    DrinkDetailEntity? randomDrinkDetail,
  });

  $DrinkDetailEntityCopyWith<$Res>? get selectedDrinkDetail;
  $DrinkDetailEntityCopyWith<$Res>? get randomDrinkDetail;
}

/// @nodoc
class _$MenuCatalogStateCopyWithImpl<$Res, $Val extends MenuCatalogState>
    implements $MenuCatalogStateCopyWith<$Res> {
  _$MenuCatalogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuCatalogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? selectedCategory = null,
    Object? cocktails = null,
    Object? searchQuery = null,
    Object? activeTab = null,
    Object? isLoadingDetail = null,
    Object? isSynthesizing = null,
    Object? selectedDrinkDetail = freezed,
    Object? randomDrinkDetail = freezed,
  }) {
    return _then(
      _value.copyWith(
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            selectedCategory: null == selectedCategory
                ? _value.selectedCategory
                : selectedCategory // ignore: cast_nullable_to_non_nullable
                      as String,
            cocktails: null == cocktails
                ? _value.cocktails
                : cocktails // ignore: cast_nullable_to_non_nullable
                      as List<AlcoholEntity>,
            searchQuery: null == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String,
            activeTab: null == activeTab
                ? _value.activeTab
                : activeTab // ignore: cast_nullable_to_non_nullable
                      as int,
            isLoadingDetail: null == isLoadingDetail
                ? _value.isLoadingDetail
                : isLoadingDetail // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSynthesizing: null == isSynthesizing
                ? _value.isSynthesizing
                : isSynthesizing // ignore: cast_nullable_to_non_nullable
                      as bool,
            selectedDrinkDetail: freezed == selectedDrinkDetail
                ? _value.selectedDrinkDetail
                : selectedDrinkDetail // ignore: cast_nullable_to_non_nullable
                      as DrinkDetailEntity?,
            randomDrinkDetail: freezed == randomDrinkDetail
                ? _value.randomDrinkDetail
                : randomDrinkDetail // ignore: cast_nullable_to_non_nullable
                      as DrinkDetailEntity?,
          )
          as $Val,
    );
  }

  /// Create a copy of MenuCatalogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DrinkDetailEntityCopyWith<$Res>? get selectedDrinkDetail {
    if (_value.selectedDrinkDetail == null) {
      return null;
    }

    return $DrinkDetailEntityCopyWith<$Res>(_value.selectedDrinkDetail!, (
      value,
    ) {
      return _then(_value.copyWith(selectedDrinkDetail: value) as $Val);
    });
  }

  /// Create a copy of MenuCatalogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DrinkDetailEntityCopyWith<$Res>? get randomDrinkDetail {
    if (_value.randomDrinkDetail == null) {
      return null;
    }

    return $DrinkDetailEntityCopyWith<$Res>(_value.randomDrinkDetail!, (value) {
      return _then(_value.copyWith(randomDrinkDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuCatalogStateImplCopyWith<$Res>
    implements $MenuCatalogStateCopyWith<$Res> {
  factory _$$MenuCatalogStateImplCopyWith(
    _$MenuCatalogStateImpl value,
    $Res Function(_$MenuCatalogStateImpl) then,
  ) = __$$MenuCatalogStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> categories,
    String selectedCategory,
    List<AlcoholEntity> cocktails,
    String searchQuery,
    int activeTab,
    bool isLoadingDetail,
    bool isSynthesizing,
    DrinkDetailEntity? selectedDrinkDetail,
    DrinkDetailEntity? randomDrinkDetail,
  });

  @override
  $DrinkDetailEntityCopyWith<$Res>? get selectedDrinkDetail;
  @override
  $DrinkDetailEntityCopyWith<$Res>? get randomDrinkDetail;
}

/// @nodoc
class __$$MenuCatalogStateImplCopyWithImpl<$Res>
    extends _$MenuCatalogStateCopyWithImpl<$Res, _$MenuCatalogStateImpl>
    implements _$$MenuCatalogStateImplCopyWith<$Res> {
  __$$MenuCatalogStateImplCopyWithImpl(
    _$MenuCatalogStateImpl _value,
    $Res Function(_$MenuCatalogStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuCatalogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? selectedCategory = null,
    Object? cocktails = null,
    Object? searchQuery = null,
    Object? activeTab = null,
    Object? isLoadingDetail = null,
    Object? isSynthesizing = null,
    Object? selectedDrinkDetail = freezed,
    Object? randomDrinkDetail = freezed,
  }) {
    return _then(
      _$MenuCatalogStateImpl(
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        selectedCategory: null == selectedCategory
            ? _value.selectedCategory
            : selectedCategory // ignore: cast_nullable_to_non_nullable
                  as String,
        cocktails: null == cocktails
            ? _value._cocktails
            : cocktails // ignore: cast_nullable_to_non_nullable
                  as List<AlcoholEntity>,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        activeTab: null == activeTab
            ? _value.activeTab
            : activeTab // ignore: cast_nullable_to_non_nullable
                  as int,
        isLoadingDetail: null == isLoadingDetail
            ? _value.isLoadingDetail
            : isLoadingDetail // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSynthesizing: null == isSynthesizing
            ? _value.isSynthesizing
            : isSynthesizing // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedDrinkDetail: freezed == selectedDrinkDetail
            ? _value.selectedDrinkDetail
            : selectedDrinkDetail // ignore: cast_nullable_to_non_nullable
                  as DrinkDetailEntity?,
        randomDrinkDetail: freezed == randomDrinkDetail
            ? _value.randomDrinkDetail
            : randomDrinkDetail // ignore: cast_nullable_to_non_nullable
                  as DrinkDetailEntity?,
      ),
    );
  }
}

/// @nodoc

class _$MenuCatalogStateImpl implements _MenuCatalogState {
  const _$MenuCatalogStateImpl({
    final List<String> categories = const [],
    this.selectedCategory = '',
    final List<AlcoholEntity> cocktails = const [],
    this.searchQuery = '',
    this.activeTab = 0,
    this.isLoadingDetail = false,
    this.isSynthesizing = false,
    this.selectedDrinkDetail,
    this.randomDrinkDetail,
  }) : _categories = categories,
       _cocktails = cocktails;

  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final String selectedCategory;
  final List<AlcoholEntity> _cocktails;
  @override
  @JsonKey()
  List<AlcoholEntity> get cocktails {
    if (_cocktails is EqualUnmodifiableListView) return _cocktails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cocktails);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final int activeTab;
  @override
  @JsonKey()
  final bool isLoadingDetail;
  @override
  @JsonKey()
  final bool isSynthesizing;
  @override
  final DrinkDetailEntity? selectedDrinkDetail;
  @override
  final DrinkDetailEntity? randomDrinkDetail;

  @override
  String toString() {
    return 'MenuCatalogState(categories: $categories, selectedCategory: $selectedCategory, cocktails: $cocktails, searchQuery: $searchQuery, activeTab: $activeTab, isLoadingDetail: $isLoadingDetail, isSynthesizing: $isSynthesizing, selectedDrinkDetail: $selectedDrinkDetail, randomDrinkDetail: $randomDrinkDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuCatalogStateImpl &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            const DeepCollectionEquality().equals(
              other._cocktails,
              _cocktails,
            ) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.activeTab, activeTab) ||
                other.activeTab == activeTab) &&
            (identical(other.isLoadingDetail, isLoadingDetail) ||
                other.isLoadingDetail == isLoadingDetail) &&
            (identical(other.isSynthesizing, isSynthesizing) ||
                other.isSynthesizing == isSynthesizing) &&
            (identical(other.selectedDrinkDetail, selectedDrinkDetail) ||
                other.selectedDrinkDetail == selectedDrinkDetail) &&
            (identical(other.randomDrinkDetail, randomDrinkDetail) ||
                other.randomDrinkDetail == randomDrinkDetail));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categories),
    selectedCategory,
    const DeepCollectionEquality().hash(_cocktails),
    searchQuery,
    activeTab,
    isLoadingDetail,
    isSynthesizing,
    selectedDrinkDetail,
    randomDrinkDetail,
  );

  /// Create a copy of MenuCatalogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuCatalogStateImplCopyWith<_$MenuCatalogStateImpl> get copyWith =>
      __$$MenuCatalogStateImplCopyWithImpl<_$MenuCatalogStateImpl>(
        this,
        _$identity,
      );
}

abstract class _MenuCatalogState implements MenuCatalogState {
  const factory _MenuCatalogState({
    final List<String> categories,
    final String selectedCategory,
    final List<AlcoholEntity> cocktails,
    final String searchQuery,
    final int activeTab,
    final bool isLoadingDetail,
    final bool isSynthesizing,
    final DrinkDetailEntity? selectedDrinkDetail,
    final DrinkDetailEntity? randomDrinkDetail,
  }) = _$MenuCatalogStateImpl;

  @override
  List<String> get categories;
  @override
  String get selectedCategory;
  @override
  List<AlcoholEntity> get cocktails;
  @override
  String get searchQuery;
  @override
  int get activeTab;
  @override
  bool get isLoadingDetail;
  @override
  bool get isSynthesizing;
  @override
  DrinkDetailEntity? get selectedDrinkDetail;
  @override
  DrinkDetailEntity? get randomDrinkDetail;

  /// Create a copy of MenuCatalogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuCatalogStateImplCopyWith<_$MenuCatalogStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
