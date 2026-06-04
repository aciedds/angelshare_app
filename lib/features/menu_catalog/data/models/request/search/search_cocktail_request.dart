import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_cocktail_request.freezed.dart';
part 'search_cocktail_request.g.dart';

@freezed
class SearchCocktailRequest with _$SearchCocktailRequest {
  const factory SearchCocktailRequest({
    required String category,
    String? searchQuery,
  }) = _SearchCocktailRequest;

  factory SearchCocktailRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchCocktailRequestFromJson(json);
}
