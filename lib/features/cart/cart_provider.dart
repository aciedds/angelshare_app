import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';
import 'package:angelshare_app/core/providers/view_state.dart';
import 'package:angelshare_app/features/cart/data/datasources/local/drift/daos/cart_dao.dart';
import 'package:angelshare_app/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:angelshare_app/features/cart/domain/models/entities/cart_item_entity.dart';
import 'package:angelshare_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:angelshare_app/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:angelshare_app/features/cart/domain/usecases/get_order_history_usecase.dart';
import 'package:angelshare_app/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:angelshare_app/features/cart/domain/usecases/update_cart_item_quantity_usecase.dart';
import 'package:angelshare_app/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:angelshare_app/features/cart/domain/usecases/checkout_usecase.dart';

part 'cart_provider.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItemEntity> cartItems,
    @Default([]) List<OrderHistoryEntity> orderHistory,
  }) = _CartState;
}

class CartNotifier extends StateNotifier<ViewState<CartState>> {
  final GetCartItemsUseCase _getCartItemsUseCase;
  final GetOrderHistoryUseCase _getOrderHistoryUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final UpdateCartItemQuantityUseCase _updateCartItemQuantityUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;
  final CheckoutUseCase _checkoutUseCase;

  CartNotifier({
    required GetCartItemsUseCase getCartItemsUseCase,
    required GetOrderHistoryUseCase getOrderHistoryUseCase,
    required AddToCartUseCase addToCartUseCase,
    required UpdateCartItemQuantityUseCase updateCartItemQuantityUseCase,
    required RemoveFromCartUseCase removeFromCartUseCase,
    required CheckoutUseCase checkoutUseCase,
  })  : _getCartItemsUseCase = getCartItemsUseCase,
        _getOrderHistoryUseCase = getOrderHistoryUseCase,
        _addToCartUseCase = addToCartUseCase,
        _updateCartItemQuantityUseCase = updateCartItemQuantityUseCase,
        _removeFromCartUseCase = removeFromCartUseCase,
        _checkoutUseCase = checkoutUseCase,
        super(const ViewState.initial(data: CartState())) {
    loadCart();
    loadHistory();
  }

  Future<void> loadCart() async {
    final currentData = state.data ?? const CartState();
    state = ViewState.loading(data: currentData);
    final result = await _getCartItemsUseCase.execute();
    result.when(
      success: (items) {
        final updatedData = currentData.copyWith(cartItems: items);
        state = ViewState.success(data: updatedData);
      },
      failure: (error) {
        state = ViewState.error(message: error.toString(), data: currentData);
      },
    );
  }

  Future<void> loadHistory() async {
    final result = await _getOrderHistoryUseCase.execute();
    result.when(
      success: (history) {
        final currentDataAfter = state.data ?? const CartState();
        final updatedData = currentDataAfter.copyWith(orderHistory: history);
        state = ViewState.success(data: updatedData);
      },
      failure: (_) {},
    );
  }

  Future<void> addToCart({
    required String idDrink,
    required String name,
    required int price,
    String? thumbnailUrl,
    int quantity = 1,
  }) async {
    final currentData = state.data ?? const CartState();
    state = ViewState.loading(data: currentData);
    final result = await _addToCartUseCase.execute(
      idDrink: idDrink,
      name: name,
      quantity: quantity,
      price: price,
      thumbnailUrl: thumbnailUrl,
    );
    await result.when(
      success: (_) async {
        await loadCart();
      },
      failure: (error) {
        state = ViewState.error(message: error.toString(), data: currentData);
      },
    );
  }

  Future<void> updateQuantity({
    required String idDrink,
    required int quantity,
  }) async {
    if (quantity <= 0) {
      await removeFromCart(idDrink: idDrink);
      return;
    }
    final currentData = state.data ?? const CartState();
    state = ViewState.loading(data: currentData);
    final result = await _updateCartItemQuantityUseCase.execute(idDrink: idDrink, quantity: quantity);
    await result.when(
      success: (_) async {
        await loadCart();
      },
      failure: (error) {
        state = ViewState.error(message: error.toString(), data: currentData);
      },
    );
  }

  Future<void> removeFromCart({required String idDrink}) async {
    final currentData = state.data ?? const CartState();
    state = ViewState.loading(data: currentData);
    final result = await _removeFromCartUseCase.execute(idDrink: idDrink);
    await result.when(
      success: (_) async {
        await loadCart();
      },
      failure: (error) {
        state = ViewState.error(message: error.toString(), data: currentData);
      },
    );
  }

  Future<void> checkout() async {
    final currentData = state.data ?? const CartState();
    state = ViewState.loading(data: currentData);
    final result = await _checkoutUseCase.execute();
    await result.when(
      success: (_) async {
        await loadCart();
        await loadHistory();
      },
      failure: (error) {
        state = ViewState.error(message: error.toString(), data: currentData);
      },
    );
  }

  int get totalMana {
    final currentData = state.data ?? const CartState();
    return currentData.cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
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

// Usecase Providers
final getCartItemsUseCaseProvider = Provider<GetCartItemsUseCase>((ref) {
  final repo = ref.watch(cartRepositoryProvider);
  return GetCartItemsUseCase(repository: repo);
});

final getOrderHistoryUseCaseProvider = Provider<GetOrderHistoryUseCase>((ref) {
  final repo = ref.watch(cartRepositoryProvider);
  return GetOrderHistoryUseCase(repository: repo);
});

final addToCartUseCaseProvider = Provider<AddToCartUseCase>((ref) {
  final repo = ref.watch(cartRepositoryProvider);
  return AddToCartUseCase(repository: repo);
});

final updateCartItemQuantityUseCaseProvider = Provider<UpdateCartItemQuantityUseCase>((ref) {
  final repo = ref.watch(cartRepositoryProvider);
  return UpdateCartItemQuantityUseCase(repository: repo);
});

final removeFromCartUseCaseProvider = Provider<RemoveFromCartUseCase>((ref) {
  final repo = ref.watch(cartRepositoryProvider);
  return RemoveFromCartUseCase(repository: repo);
});

final checkoutUseCaseProvider = Provider<CheckoutUseCase>((ref) {
  final repo = ref.watch(cartRepositoryProvider);
  return CheckoutUseCase(repository: repo);
});

final cartNotifierProvider = StateNotifierProvider<CartNotifier, ViewState<CartState>>((ref) {
  final getCartItems = ref.watch(getCartItemsUseCaseProvider);
  final getOrderHistory = ref.watch(getOrderHistoryUseCaseProvider);
  final addToCart = ref.watch(addToCartUseCaseProvider);
  final updateCartItemQuantity = ref.watch(updateCartItemQuantityUseCaseProvider);
  final removeFromCart = ref.watch(removeFromCartUseCaseProvider);
  final checkout = ref.watch(checkoutUseCaseProvider);

  return CartNotifier(
    getCartItemsUseCase: getCartItems,
    getOrderHistoryUseCase: getOrderHistory,
    addToCartUseCase: addToCart,
    updateCartItemQuantityUseCase: updateCartItemQuantity,
    removeFromCartUseCase: removeFromCart,
    checkoutUseCase: checkout,
  );
});
