import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/repositories/menu_catalog_repository.dart';

class GetCocktailsByCategoryUseCase {
  final MenuCatalogRepository _repository;

  GetCocktailsByCategoryUseCase({required MenuCatalogRepository repository})
      : _repository = repository;

  Future<List<AlcoholEntity>> execute({required String category}) {
    return _repository.getCocktailsByCategory(category: category);
  }
}
