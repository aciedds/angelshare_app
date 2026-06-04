import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/features/cart/data/datasources/local/drift/daos/cart_dao.dart';
import 'package:angelshare_app/features/cart/domain/models/entities/cart_item_entity.dart';
import 'package:angelshare_app/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDao _cartDao;

  CartRepositoryImpl({required CartDao cartDao}) : _cartDao = cartDao;

  @override
  Future<List<CartItemEntity>> getCartItems() async {
    final list = await _cartDao.getCartItems();
    return list
        .map((item) => CartItemEntity(
              id: item.idDrink,
              name: item.strDrink,
              quantity: item.quantity,
              price: item.price,
              thumbnailUrl: item.strDrinkThumb,
            ))
        .toList();
  }

  @override
  Future<void> addToCart({
    required String idDrink,
    required String name,
    required int quantity,
    required int price,
    String? thumbnailUrl,
  }) async {
    final item = CartTableData(
      idDrink: idDrink,
      strDrink: name,
      strDrinkThumb: thumbnailUrl,
      quantity: quantity,
      price: price,
    );
    await _cartDao.addToCart(item: item);
  }

  @override
  Future<void> updateCartItemQuantity({
    required String idDrink,
    required int quantity,
  }) async {
    final list = await _cartDao.getCartItems();
    final match = list.firstWhere((element) => element.idDrink == idDrink);
    final updated = match.copyWith(quantity: quantity);
    await _cartDao.updateCartItem(item: updated);
  }

  @override
  Future<void> removeFromCart({required String idDrink}) async {
    await _cartDao.deleteCartItem(idDrink: idDrink);
  }

  @override
  Future<void> clearCart() async {
    await _cartDao.clearCart();
  }

  @override
  Future<List<OrderHistoryEntity>> getOrderHistory() async {
    final list = await _cartDao.getOrderHistory();
    return list
        .map((item) => OrderHistoryEntity(
              id: item.id,
              idDrink: item.idDrink,
              name: item.strDrink,
              quantity: item.quantity,
              orderedAt: item.orderedAt,
              thumbnailUrl: item.strDrinkThumb,
            ))
        .toList();
  }

  @override
  Future<void> checkout() async {
    await _cartDao.checkout();
  }
}
