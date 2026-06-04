import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/repositories/menu_catalog_repository.dart';

class GetCocktailDetailUseCase {
  final MenuCatalogRepository _repository;

  GetCocktailDetailUseCase({required MenuCatalogRepository repository})
      : _repository = repository;

  Future<DrinkDetailEntity> execute({required String id}) {
    return _repository.getCocktailDetail(id: id);
  }
}
