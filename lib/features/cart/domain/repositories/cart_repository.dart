import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/cart/domain/models/entities/cart_item_entity.dart';

abstract class CartRepository {
  Future<DataState<List<CartItemEntity>>> getCartItems();
  
  Future<DataState<void>> addToCart({
    required String idDrink,
    required String name,
    required int quantity,
    required int price,
    String? thumbnailUrl,
  });

  Future<DataState<void>> updateCartItemQuantity({
    required String idDrink,
    required int quantity,
  });

  Future<DataState<void>> removeFromCart({required String idDrink});
  
  Future<DataState<void>> clearCart();
  
  Future<DataState<List<OrderHistoryEntity>>> getOrderHistory();
  
  Future<DataState<void>> checkout();
}
