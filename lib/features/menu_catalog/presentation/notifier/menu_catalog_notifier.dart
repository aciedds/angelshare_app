import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/repositories/menu_catalog_repository.dart';
import 'package:angelshare_app/features/menu_catalog/domain/usecases/get_cocktails_by_category_usecase.dart';
import 'package:angelshare_app/features/menu_catalog/domain/usecases/get_cocktail_detail_usecase.dart';
import 'package:angelshare_app/features/menu_catalog/domain/usecases/get_random_cocktail_usecase.dart';

part 'menu_catalog_notifier.freezed.dart';

@freezed
class MenuCatalogState with _$MenuCatalogState {
  const factory MenuCatalogState({
    @Default(false) bool isLoading,
    @Default([]) List<String> categories,
    @Default('') String selectedCategory,
    @Default([]) List<AlcoholEntity> cocktails,
    @Default('') String searchQuery,
    @Default(0) int activeTab,
    @Default(false) bool isLoadingDetail,
    @Default(false) bool isSynthesizing,
    DrinkDetailEntity? selectedDrinkDetail,
    DrinkDetailEntity? randomDrinkDetail,
    String? errorMessage,
  }) = _MenuCatalogState;
}

class MenuCatalogNotifier extends StateNotifier<MenuCatalogState> {
  final GetCocktailsByCategoryUseCase _getCocktailsUseCase;
  final GetCocktailDetailUseCase _getCocktailDetailUseCase;
  final GetRandomCocktailUseCase _getRandomCocktailUseCase;
  final MenuCatalogRepository _repository;

  MenuCatalogNotifier({
    required GetCocktailsByCategoryUseCase getCocktailsUseCase,
    required GetCocktailDetailUseCase getCocktailDetailUseCase,
    required GetRandomCocktailUseCase getRandomCocktailUseCase,
    required MenuCatalogRepository repository,
  })  : _getCocktailsUseCase = getCocktailsUseCase,
        _getCocktailDetailUseCase = getCocktailDetailUseCase,
        _getRandomCocktailUseCase = getRandomCocktailUseCase,
        _repository = repository,
        super(const MenuCatalogState()) {
    init();
  }

  Future<void> init() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final categoriesList = await _repository.getCategories();
      if (categoriesList.isNotEmpty) {
        state = state.copyWith(
          categories: categoriesList,
          selectedCategory: categoriesList.first,
        );
        await fetchCocktails();
      } else {
        state = state.copyWith(isLoading: false, errorMessage: 'No categories available');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> selectCategory({required String category}) async {
    if (state.selectedCategory == category) return;
    state = state.copyWith(selectedCategory: category, searchQuery: '');
    await fetchCocktails();
  }

  Future<void> setSearchQuery({required String query}) async {
    state = state.copyWith(searchQuery: query);
  }

  void setTab({required int index}) {
    state = state.copyWith(activeTab: index);
  }

  Future<void> fetchCocktails() async {
    if (state.selectedCategory.isEmpty) return;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final list = await _getCocktailsUseCase.execute(category: state.selectedCategory);
      state = state.copyWith(cocktails: list, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> fetchDetail({required String id}) async {
    state = state.copyWith(isLoadingDetail: true, errorMessage: null, selectedDrinkDetail: null);
    try {
      final detail = await _getCocktailDetailUseCase.execute(id: id);
      state = state.copyWith(selectedDrinkDetail: detail, isLoadingDetail: false);
    } catch (e) {
      state = state.copyWith(isLoadingDetail: false, errorMessage: e.toString());
    }
  }

  Future<void> fetchRandom() async {
    state = state.copyWith(isSynthesizing: true, errorMessage: null, randomDrinkDetail: null);
    try {
      await Future.delayed(const Duration(milliseconds: 1500));
      final detail = await _getRandomCocktailUseCase.execute();
      state = state.copyWith(randomDrinkDetail: detail, isSynthesizing: false);
    } catch (e) {
      state = state.copyWith(isSynthesizing: false, errorMessage: e.toString());
    }
  }

  void clearDetail() {
    state = state.copyWith(selectedDrinkDetail: null);
  }

  List<AlcoholEntity> getFilteredCocktails() {
    if (state.searchQuery.isEmpty) {
      return state.cocktails;
    }
    final q = state.searchQuery.toLowerCase();
    return state.cocktails.where((c) => c.name.toLowerCase().contains(q)).toList();
  }
}
