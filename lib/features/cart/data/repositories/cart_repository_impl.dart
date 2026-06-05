import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/cart/data/datasources/local/drift/daos/cart_dao.dart';
import 'package:angelshare_app/features/cart/domain/models/entities/cart_item_entity.dart';
import 'package:angelshare_app/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDao _cartDao;

  CartRepositoryImpl({required CartDao cartDao}) : _cartDao = cartDao;

  @override
  Future<DataState<List<CartItemEntity>>> getCartItems() async {
    try {
      final list = await _cartDao.getCartItems();
      final domainList = list
          .map((item) => CartItemEntity(
                id: item.idDrink,
                name: item.strDrink,
                quantity: item.quantity,
                price: item.price,
                thumbnailUrl: item.strDrinkThumb,
              ))
          .toList();
      return DataState.success(domainList);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> addToCart({
    required String idDrink,
    required String name,
    required int quantity,
    required int price,
    String? thumbnailUrl,
  }) async {
    try {
      final item = CartTableData(
        idDrink: idDrink,
        strDrink: name,
        strDrinkThumb: thumbnailUrl,
        quantity: quantity,
        price: price,
      );
      await _cartDao.addToCart(item: item);
      return const DataState.success(null);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> updateCartItemQuantity({
    required String idDrink,
    required int quantity,
  }) async {
    try {
      final list = await _cartDao.getCartItems();
      final match = list.firstWhere((element) => element.idDrink == idDrink);
      final updated = match.copyWith(quantity: quantity);
      await _cartDao.updateCartItem(item: updated);
      return const DataState.success(null);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> removeFromCart({required String idDrink}) async {
    try {
      await _cartDao.deleteCartItem(idDrink: idDrink);
      return const DataState.success(null);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> clearCart() async {
    try {
      await _cartDao.clearCart();
      return const DataState.success(null);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<DataState<List<OrderHistoryEntity>>> getOrderHistory() async {
    try {
      final list = await _cartDao.getOrderHistory();
      final domainList = list
          .map((item) => OrderHistoryEntity(
                id: item.id,
                idDrink: item.idDrink,
                name: item.strDrink,
                quantity: item.quantity,
                orderedAt: item.orderedAt,
                thumbnailUrl: item.strDrinkThumb,
              ))
          .toList();
      return DataState.success(domainList);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> checkout() async {
    try {
      await _cartDao.checkout();
      return const DataState.success(null);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }
}
