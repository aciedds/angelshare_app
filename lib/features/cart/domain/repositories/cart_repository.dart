import 'package:angelshare_app/features/cart/domain/models/entities/cart_item_entity.dart';

abstract class CartRepository {
  Future<List<CartItemEntity>> getCartItems();
  
  Future<void> addToCart({
    required String idDrink,
    required String name,
    required int quantity,
    required int price,
    String? thumbnailUrl,
  });

  Future<void> updateCartItemQuantity({
    required String idDrink,
    required int quantity,
  });

  Future<void> removeFromCart({required String idDrink});
  
  Future<void> clearCart();
  
  Future<List<OrderHistoryEntity>> getOrderHistory();
  
  Future<void> checkout();
}
