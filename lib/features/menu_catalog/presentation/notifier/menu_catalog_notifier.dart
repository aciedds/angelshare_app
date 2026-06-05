import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:angelshare_app/core/providers/view_state.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/usecases/get_cocktails_by_category_usecase.dart';
import 'package:angelshare_app/features/menu_catalog/domain/usecases/get_cocktail_detail_usecase.dart';
import 'package:angelshare_app/features/menu_catalog/domain/usecases/get_random_cocktail_usecase.dart';
import 'package:angelshare_app/features/menu_catalog/domain/usecases/get_categories_usecase.dart';

part 'menu_catalog_notifier.freezed.dart';

@freezed
class MenuCatalogState with _$MenuCatalogState {
  const factory MenuCatalogState({
    @Default([]) List<String> categories,
    @Default('') String selectedCategory,
    @Default([]) List<AlcoholEntity> cocktails,
    @Default('') String searchQuery,
    @Default(0) int activeTab,
    @Default(false) bool isLoadingDetail,
    @Default(false) bool isSynthesizing,
    DrinkDetailEntity? selectedDrinkDetail,
    DrinkDetailEntity? randomDrinkDetail,
  }) = _MenuCatalogState;
}

class MenuCatalogNotifier extends StateNotifier<ViewState<MenuCatalogState>> {
  final GetCocktailsByCategoryUseCase _getCocktailsUseCase;
  final GetCocktailDetailUseCase _getCocktailDetailUseCase;
  final GetRandomCocktailUseCase _getRandomCocktailUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;

  MenuCatalogNotifier({
    required GetCocktailsByCategoryUseCase getCocktailsUseCase,
    required GetCocktailDetailUseCase getCocktailDetailUseCase,
    required GetRandomCocktailUseCase getRandomCocktailUseCase,
    required GetCategoriesUseCase getCategoriesUseCase,
  })  : _getCocktailsUseCase = getCocktailsUseCase,
        _getCocktailDetailUseCase = getCocktailDetailUseCase,
        _getRandomCocktailUseCase = getRandomCocktailUseCase,
        _getCategoriesUseCase = getCategoriesUseCase,
        super(const ViewState.initial(data: MenuCatalogState())) {
    init();
  }

  Future<void> init() async {
    final currentData = state.data ?? const MenuCatalogState();
    state = ViewState.loading(data: currentData);
    
    final result = await _getCategoriesUseCase.execute();
    await result.when(
      success: (categoriesList) async {
        if (categoriesList.isNotEmpty) {
          final updatedData = currentData.copyWith(
            categories: categoriesList,
            selectedCategory: categoriesList.first,
          );
          state = ViewState.success(data: updatedData);
          await fetchCocktails();
        } else {
          state = const ViewState.error(message: 'No categories available');
        }
      },
      failure: (error) {
        state = ViewState.error(message: error.toString(), data: currentData);
      },
    );
  }

  Future<void> selectCategory({required String category}) async {
    final currentData = state.data ?? const MenuCatalogState();
    if (currentData.selectedCategory == category) return;
    
    final updatedData = currentData.copyWith(
      selectedCategory: category,
      searchQuery: '',
    );
    state = ViewState.success(data: updatedData);
    await fetchCocktails();
  }

  Future<void> setSearchQuery({required String query}) async {
    final currentData = state.data ?? const MenuCatalogState();
    final updatedData = currentData.copyWith(searchQuery: query);
    state = ViewState.success(data: updatedData);
  }

  void setTab({required int index}) {
    final currentData = state.data ?? const MenuCatalogState();
    final updatedData = currentData.copyWith(activeTab: index);
    state = ViewState.success(data: updatedData);
  }

  Future<void> fetchCocktails() async {
    final currentData = state.data ?? const MenuCatalogState();
    if (currentData.selectedCategory.isEmpty) return;
    
    state = ViewState.loading(data: currentData);
    final result = await _getCocktailsUseCase.execute(category: currentData.selectedCategory);
    
    result.when(
      success: (list) {
        final updatedData = currentData.copyWith(
          cocktails: list,
          selectedCategory: currentData.selectedCategory,
        );
        state = ViewState.success(data: updatedData);
      },
      failure: (error) {
        state = ViewState.error(message: error.toString(), data: currentData);
      },
    );
  }

  Future<void> fetchDetail({required String id}) async {
    final currentData = state.data ?? const MenuCatalogState();
    final loadingDetailData = currentData.copyWith(
      isLoadingDetail: true,
      selectedDrinkDetail: null,
    );
    state = ViewState.success(data: loadingDetailData);
    
    final result = await _getCocktailDetailUseCase.execute(id: id);
    result.when(
      success: (detail) {
        final currentDataAfterFetch = state.data ?? const MenuCatalogState();
        final successData = currentDataAfterFetch.copyWith(
          selectedDrinkDetail: detail,
          isLoadingDetail: false,
        );
        state = ViewState.success(data: successData);
      },
      failure: (error) {
        final currentDataAfterFetch = state.data ?? const MenuCatalogState();
        final errorData = currentDataAfterFetch.copyWith(
          isLoadingDetail: false,
        );
        state = ViewState.error(message: error.toString(), data: errorData);
      },
    );
  }

  Future<void> fetchRandom({String? targetCategory}) async {
    final currentData = state.data ?? const MenuCatalogState();
    final loadingRandomData = currentData.copyWith(
      isSynthesizing: true,
      randomDrinkDetail: null,
    );
    state = ViewState.success(data: loadingRandomData);

    try {
      await Future.delayed(const Duration(milliseconds: 1500));
      
      DrinkDetailEntity? detail;
      if (targetCategory != null && targetCategory.isNotEmpty) {
        // Try up to 5 times to fetch a matching category
        for (int i = 0; i < 5; i++) {
          final result = await _getRandomCocktailUseCase.execute();
          final candidate = result.when(
            success: (d) => d,
            failure: (e) => null,
          );
          if (candidate != null && candidate.category.toLowerCase() == targetCategory.toLowerCase()) {
            detail = candidate;
            break;
          }
        }
        if (detail == null) {
          final result = await _getRandomCocktailUseCase.execute();
          detail = result.when(
            success: (d) => d,
            failure: (e) => throw e,
          );
        }
      } else {
        final result = await _getRandomCocktailUseCase.execute();
        detail = result.when(
          success: (d) => d,
          failure: (e) => throw e,
        );
      }
      
      final currentDataAfterFetch = state.data ?? const MenuCatalogState();
      final successData = currentDataAfterFetch.copyWith(
        randomDrinkDetail: detail,
        isSynthesizing: false,
      );
      state = ViewState.success(data: successData);
    } catch (e) {
      final currentDataAfterFetch = state.data ?? const MenuCatalogState();
      final errorData = currentDataAfterFetch.copyWith(
        isSynthesizing: false,
      );
      state = ViewState.error(message: e.toString(), data: errorData);
    }
  }

  void clearDetail() {
    final currentData = state.data ?? const MenuCatalogState();
    final updatedData = currentData.copyWith(selectedDrinkDetail: null);
    state = ViewState.success(data: updatedData);
  }

  List<AlcoholEntity> getFilteredCocktails() {
    final currentData = state.data ?? const MenuCatalogState();
    if (currentData.searchQuery.isEmpty) {
      return currentData.cocktails;
    }
    final q = currentData.searchQuery.toLowerCase();
    return currentData.cocktails.where((c) => c.name.toLowerCase().contains(q)).toList();
  }
}
