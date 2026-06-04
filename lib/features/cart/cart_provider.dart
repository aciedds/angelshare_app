import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';
import 'package:angelshare_app/features/cart/data/datasources/local/drift/daos/cart_dao.dart';
import 'package:angelshare_app/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:angelshare_app/features/cart/domain/models/entities/cart_item_entity.dart';
import 'package:angelshare_app/features/cart/domain/repositories/cart_repository.dart';

part 'cart_provider.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItemEntity> cartItems,
    @Default([]) List<OrderHistoryEntity> orderHistory,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _CartState;
}

class CartNotifier extends StateNotifier<CartState> {
  final CartRepository _cartRepository;

  CartNotifier({required CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(const CartState()) {
    loadCart();
    loadHistory();
  }

  Future<void> loadCart() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final items = await _cartRepository.getCartItems();
      state = state.copyWith(cartItems: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> loadHistory() async {
    try {
      final history = await _cartRepository.getOrderHistory();
      state = state.copyWith(orderHistory: history);
    } catch (_) {}
  }

  Future<void> addToCart({
    required String idDrink,
    required String name,
    required int price,
    String? thumbnailUrl,
    int quantity = 1,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await _cartRepository.addToCart(
        idDrink: idDrink,
        name: name,
        quantity: quantity,
        price: price,
        thumbnailUrl: thumbnailUrl,
      );
      await loadCart();
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> updateQuantity({
    required String idDrink,
    required int quantity,
  }) async {
    if (quantity <= 0) {
      await removeFromCart(idDrink: idDrink);
      return;
    }
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await _cartRepository.updateCartItemQuantity(idDrink: idDrink, quantity: quantity);
      await loadCart();
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> removeFromCart({required String idDrink}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await _cartRepository.removeFromCart(idDrink: idDrink);
      await loadCart();
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> checkout() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await _cartRepository.checkout();
      await loadCart();
      await loadHistory();
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  int get totalMana {
    return state.cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}

// Providers DI
final cartDaoProvider = Provider<CartDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.cartDao;
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final dao = ref.watch(cartDaoProvider);
  return CartRepositoryImpl(cartDao: dao);
});

final cartNotifierProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  final repo = ref.watch(cartRepositoryProvider);
  return CartNotifier(cartRepository: repo);
});
