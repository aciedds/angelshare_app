import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/repositories/menu_catalog_repository.dart';

class GetRandomCocktailUseCase {
  final MenuCatalogRepository _repository;

  GetRandomCocktailUseCase({required MenuCatalogRepository repository})
      : _repository = repository;

  Future<DrinkDetailEntity> execute() {
    return _repository.getRandomCocktail();
  }
}
