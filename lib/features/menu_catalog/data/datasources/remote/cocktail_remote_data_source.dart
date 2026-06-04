import 'package:dio/dio.dart';
import 'package:angelshare_app/features/menu_catalog/data/models/response/alcohol/alcohol_response.dart';
import 'package:angelshare_app/features/menu_catalog/data/models/response/alcohol/drink_detail_response.dart';

class CocktailRemoteDataSource {
  final Dio _dio;

  CocktailRemoteDataSource({required Dio dio}) : _dio = dio;

  Future<AlcoholResponse> getCocktailsByCategory({required String category}) async {
    final response = await _dio.get(
      'filter.php',
      queryParameters: {'c': category},
    );
    if (response.data == null || response.data is String) {
      throw Exception('Failed to load cocktails: empty or invalid response');
    }
    return AlcoholResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<DrinkDetailResponse> getCocktailDetail({required String id}) async {
    final response = await _dio.get(
      'lookup.php',
      queryParameters: {'i': id},
    );
    if (response.data == null || response.data is String) {
      throw Exception('Failed to load drink detail: empty or invalid response');
    }
    return DrinkDetailResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<DrinkDetailResponse> getRandomCocktail() async {
    final response = await _dio.get('random.php');
    if (response.data == null || response.data is String) {
      throw Exception('Failed to load random drink: empty or invalid response');
    }
    return DrinkDetailResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<String>> getCategories() async {
    final response = await _dio.get(
      'list.php',
      queryParameters: {'c': 'list'},
    );
    if (response.data == null || response.data['drinks'] == null) {
      return [];
    }
    final List drinks = response.data['drinks'] as List;
    return drinks.map((item) => item['strCategory'] as String).toList();
  }
}
