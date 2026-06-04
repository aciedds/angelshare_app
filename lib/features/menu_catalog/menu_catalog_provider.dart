import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/core/network/dio_client.dart';
import 'package:angelshare_app/features/menu_catalog/data/datasources/local/drift/daos/alcohol_dao.dart';
import 'package:angelshare_app/features/menu_catalog/data/datasources/remote/cocktail_remote_data_source.dart';
import 'package:angelshare_app/features/menu_catalog/data/repositories/menu_catalog_repository_impl.dart';
import 'package:angelshare_app/features/menu_catalog/domain/repositories/menu_catalog_repository.dart';
import 'package:angelshare_app/features/menu_catalog/domain/usecases/get_cocktails_by_category_usecase.dart';
import 'package:angelshare_app/features/menu_catalog/domain/usecases/get_cocktail_detail_usecase.dart';
import 'package:angelshare_app/features/menu_catalog/domain/usecases/get_random_cocktail_usecase.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/notifier/menu_catalog_notifier.dart';

// Central Database Provider
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

// DAO Provider
final alcoholDaoProvider = Provider<AlcoholDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.alcoholDao;
});

// Remote Data Source Provider
final cocktailRemoteDataSourceProvider = Provider<CocktailRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return CocktailRemoteDataSource(dio: dio);
});

// Repository Provider
final menuCatalogRepositoryProvider = Provider<MenuCatalogRepository>((ref) {
  final remote = ref.watch(cocktailRemoteDataSourceProvider);
  final local = ref.watch(alcoholDaoProvider);
  return MenuCatalogRepositoryImpl(remoteDataSource: remote, alcoholDao: local);
});

// UseCase Providers
final getCocktailsByCategoryUseCaseProvider = Provider<GetCocktailsByCategoryUseCase>((ref) {
  final repo = ref.watch(menuCatalogRepositoryProvider);
  return GetCocktailsByCategoryUseCase(repository: repo);
});

final getCocktailDetailUseCaseProvider = Provider<GetCocktailDetailUseCase>((ref) {
  final repo = ref.watch(menuCatalogRepositoryProvider);
  return GetCocktailDetailUseCase(repository: repo);
});

final getRandomCocktailUseCaseProvider = Provider<GetRandomCocktailUseCase>((ref) {
  final repo = ref.watch(menuCatalogRepositoryProvider);
  return GetRandomCocktailUseCase(repository: repo);
});

// Notifier Provider for UI State
final menuCatalogNotifierProvider = StateNotifierProvider<MenuCatalogNotifier, MenuCatalogState>((ref) {
  final getCocktailsUseCase = ref.watch(getCocktailsByCategoryUseCaseProvider);
  final getCocktailDetailUseCase = ref.watch(getCocktailDetailUseCaseProvider);
  final getRandomCocktailUseCase = ref.watch(getRandomCocktailUseCaseProvider);
  final repo = ref.watch(menuCatalogRepositoryProvider);
  
  return MenuCatalogNotifier(
    getCocktailsUseCase: getCocktailsUseCase,
    getCocktailDetailUseCase: getCocktailDetailUseCase,
    getRandomCocktailUseCase: getRandomCocktailUseCase,
    repository: repo,
  );
});
