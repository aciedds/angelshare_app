import 'package:freezed_annotation/freezed_annotation.dart';

part 'drink_detail_response.freezed.dart';
part 'drink_detail_response.g.dart';

@freezed
class DrinkDetailResponse with _$DrinkDetailResponse {
  const factory DrinkDetailResponse({
    required List<DrinkDetailResponseItem> drinks,
  }) = _DrinkDetailResponse;

  factory DrinkDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DrinkDetailResponseFromJson(json);
}

@freezed
class DrinkDetailResponseItem with _$DrinkDetailResponseItem {
  const factory DrinkDetailResponseItem({
    required String idDrink,
    required String strDrink,
    String? strCategory,
    String? strGlass,
    String? strAlcoholic,
    String? strInstructions,
    String? strDrinkThumb,
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    String? strIngredient4,
    String? strIngredient5,
    String? strIngredient6,
    String? strIngredient7,
    String? strIngredient8,
    String? strIngredient9,
    String? strIngredient10,
    String? strIngredient11,
    String? strIngredient12,
    String? strIngredient13,
    String? strIngredient14,
    String? strIngredient15,
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    String? strMeasure4,
    String? strMeasure5,
    String? strMeasure6,
    String? strMeasure7,
    String? strMeasure8,
    String? strMeasure9,
    String? strMeasure10,
    String? strMeasure11,
    String? strMeasure12,
    String? strMeasure13,
    String? strMeasure14,
    String? strMeasure15,
  }) = _DrinkDetailResponseItem;

  factory DrinkDetailResponseItem.fromJson(Map<String, dynamic> json) =>
      _$DrinkDetailResponseItemFromJson(json);
}
