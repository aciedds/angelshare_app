import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_item_entity.freezed.dart';

@freezed
class FavoriteItemEntity with _$FavoriteItemEntity {
  const factory FavoriteItemEntity({
    required String id,
    required String name,
    required String category,
    required DateTime addedAt,
    String? thumbnailUrl,
  }) = _FavoriteItemEntity;
}
