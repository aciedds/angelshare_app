import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';
import 'package:angelshare_app/core/providers/view_state.dart';
import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/favorites/data/datasources/local/drift/daos/favorites_dao.dart';
import 'package:angelshare_app/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:angelshare_app/features/favorites/domain/models/entities/favorite_item_entity.dart';
import 'package:angelshare_app/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:angelshare_app/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:angelshare_app/features/favorites/domain/usecases/add_favorite_usecase.dart';
import 'package:angelshare_app/features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:angelshare_app/features/favorites/domain/usecases/check_is_favorite_usecase.dart';

part 'favorites_provider.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default([]) List<FavoriteItemEntity> favorites,
  }) = _FavoritesState;
}

class FavoritesNotifier extends StateNotifier<ViewState<FavoritesState>> {
  final GetFavoritesUseCase _getFavoritesUseCase;
  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final CheckIsFavoriteUseCase _checkIsFavoriteUseCase;

  FavoritesNotifier({
    required GetFavoritesUseCase getFavoritesUseCase,
    required AddFavoriteUseCase addFavoriteUseCase,
    required RemoveFavoriteUseCase removeFavoriteUseCase,
    required CheckIsFavoriteUseCase checkIsFavoriteUseCase,
  })  : _getFavoritesUseCase = getFavoritesUseCase,
        _addFavoriteUseCase = addFavoriteUseCase,
        _removeFavoriteUseCase = removeFavoriteUseCase,
        _checkIsFavoriteUseCase = checkIsFavoriteUseCase,
        super(const ViewState.initial(data: FavoritesState())) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final currentData = state.data ?? const FavoritesState();
    state = ViewState.loading(data: currentData);
    final result = await _getFavoritesUseCase.execute();
    result.when(
      success: (items) {
        final updatedData = currentData.copyWith(favorites: items);
        state = ViewState.success(data: updatedData);
      },
      failure: (error) {
        state = ViewState.error(message: error.toString(), data: currentData);
      },
    );
  }

  Future<void> toggleFavorite({
    required String idDrink,
    required String name,
    required String category,
    String? thumbnailUrl,
  }) async {
    final currentData = state.data ?? const FavoritesState();
    state = ViewState.loading(data: currentData);
    final isFavResult = await _checkIsFavoriteUseCase.execute(idDrink: idDrink);
    
    await isFavResult.when(
      success: (isFav) async {
        final DataState<void> toggleResult;
        if (isFav) {
          toggleResult = await _removeFavoriteUseCase.execute(idDrink: idDrink);
        } else {
          toggleResult = await _addFavoriteUseCase.execute(
            idDrink: idDrink,
            name: name,
            category: category,
            thumbnailUrl: thumbnailUrl,
          );
        }
        await toggleResult.when(
          success: (_) async {
            await loadFavorites();
          },
          failure: (error) {
            state = ViewState.error(message: error.toString(), data: currentData);
          },
        );
      },
      failure: (error) {
        state = ViewState.error(message: error.toString(), data: currentData);
      },
    );
  }

  Future<bool> checkIsFavorite({required String idDrink}) async {
    final res = await _checkIsFavoriteUseCase.execute(idDrink: idDrink);
    return res.when(
      success: (val) => val,
      failure: (_) => false,
    );
  }
}

// Providers DI
final favoritesDaoProvider = Provider<FavoritesDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.favoritesDao;
});

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  final dao = ref.watch(favoritesDaoProvider);
  return FavoritesRepositoryImpl(favoritesDao: dao);
});

// Usecase Providers
final getFavoritesUseCaseProvider = Provider<GetFavoritesUseCase>((ref) {
  final repo = ref.watch(favoritesRepositoryProvider);
  return GetFavoritesUseCase(repository: repo);
});

final addFavoriteUseCaseProvider = Provider<AddFavoriteUseCase>((ref) {
  final repo = ref.watch(favoritesRepositoryProvider);
  return AddFavoriteUseCase(repository: repo);
});

final removeFavoriteUseCaseProvider = Provider<RemoveFavoriteUseCase>((ref) {
  final repo = ref.watch(favoritesRepositoryProvider);
  return RemoveFavoriteUseCase(repository: repo);
});

final checkIsFavoriteUseCaseProvider = Provider<CheckIsFavoriteUseCase>((ref) {
  final repo = ref.watch(favoritesRepositoryProvider);
  return CheckIsFavoriteUseCase(repository: repo);
});

final favoritesNotifierProvider = StateNotifierProvider<FavoritesNotifier, ViewState<FavoritesState>>((ref) {
  final getFavorites = ref.watch(getFavoritesUseCaseProvider);
  final addFavorite = ref.watch(addFavoriteUseCaseProvider);
  final removeFavorite = ref.watch(removeFavoriteUseCaseProvider);
  final checkIsFavorite = ref.watch(checkIsFavoriteUseCaseProvider);

  return FavoritesNotifier(
    getFavoritesUseCase: getFavorites,
    addFavoriteUseCase: addFavorite,
    removeFavoriteUseCase: removeFavorite,
    checkIsFavoriteUseCase: checkIsFavorite,
  );
});
