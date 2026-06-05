import 'package:angelshare_app/core/providers/data_state.dart';
import 'package:angelshare_app/features/menu_catalog/domain/repositories/menu_catalog_repository.dart';

class GetCategoriesUseCase {
  final MenuCatalogRepository _repository;

  GetCategoriesUseCase({required MenuCatalogRepository repository})
      : _repository = repository;

  Future<DataState<List<String>>> execute() {
    return _repository.getCategories();
  }
}
