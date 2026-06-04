import 'package:freezed_annotation/freezed_annotation.dart';

part 'drink_detail_entity.freezed.dart';

@freezed
class DrinkDetailEntity with _$DrinkDetailEntity {
  const factory DrinkDetailEntity({
    required String id,
    required String name,
    required String category,
    required String glass,
    required String alcoholic,
    required String instructions,
    required List<IngredientEntity> ingredients,
    String? thumbnailUrl,
  }) = _DrinkDetailEntity;
}

@freezed
class IngredientEntity with _$IngredientEntity {
  const factory IngredientEntity({
    required String name,
    required String measure,
  }) = _IngredientEntity;
}
