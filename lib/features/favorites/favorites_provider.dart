import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';
import 'package:angelshare_app/features/favorites/data/datasources/local/drift/daos/favorites_dao.dart';
import 'package:angelshare_app/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:angelshare_app/features/favorites/domain/models/entities/favorite_item_entity.dart';
import 'package:angelshare_app/features/favorites/domain/repositories/favorites_repository.dart';

part 'favorites_provider.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default([]) List<FavoriteItemEntity> favorites,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _FavoritesState;
}

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  final FavoritesRepository _favoritesRepository;

  FavoritesNotifier({required FavoritesRepository favoritesRepository})
      : _favoritesRepository = favoritesRepository,
        super(const FavoritesState()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final items = await _favoritesRepository.getFavorites();
      state = state.copyWith(favorites: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> toggleFavorite({
    required String idDrink,
    required String name,
    required String category,
    String? thumbnailUrl,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final isFav = await _favoritesRepository.isFavorite(idDrink: idDrink);
      if (isFav) {
        await _favoritesRepository.removeFavorite(idDrink: idDrink);
      } else {
        await _favoritesRepository.addFavorite(
          idDrink: idDrink,
          name: name,
          category: category,
          thumbnailUrl: thumbnailUrl,
        );
      }
      await loadFavorites();
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<bool> checkIsFavorite({required String idDrink}) async {
    return _favoritesRepository.isFavorite(idDrink: idDrink);
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

final favoritesNotifierProvider = StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) {
  final repo = ref.watch(favoritesRepositoryProvider);
  return FavoritesNotifier(favoritesRepository: repo);
});
