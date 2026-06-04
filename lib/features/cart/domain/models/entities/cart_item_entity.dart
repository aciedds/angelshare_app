import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_entity.freezed.dart';

@freezed
class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
    required String id,
    required String name,
    required int quantity,
    required int price,
    String? thumbnailUrl,
  }) = _CartItemEntity;
}

@freezed
class OrderHistoryEntity with _$OrderHistoryEntity {
  const factory OrderHistoryEntity({
    required int id,
    required String idDrink,
    required String name,
    required int quantity,
    required DateTime orderedAt,
    String? thumbnailUrl,
  }) = _OrderHistoryEntity;
}
