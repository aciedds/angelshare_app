import 'package:freezed_annotation/freezed_annotation.dart';

part 'alcohol_response.freezed.dart';
part 'alcohol_response.g.dart';

@freezed
class AlcoholResponse with _$AlcoholResponse {
  const factory AlcoholResponse({
    required List<AlcoholResponseItem> drinks,
  }) = _AlcoholResponse;

  factory AlcoholResponse.fromJson(Map<String, dynamic> json) =>
      _$AlcoholResponseFromJson(json);
}

@freezed
class AlcoholResponseItem with _$AlcoholResponseItem {
  const factory AlcoholResponseItem({
    required String idDrink,
    required String strDrink,
    String? strDrinkThumb,
  }) = _AlcoholResponseItem;

  factory AlcoholResponseItem.fromJson(Map<String, dynamic> json) =>
      _$AlcoholResponseItemFromJson(json);
}
