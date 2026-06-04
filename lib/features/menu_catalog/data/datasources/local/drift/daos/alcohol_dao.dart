import 'package:drift/drift.dart';
import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/features/menu_catalog/data/datasources/local/drift/tables/alcohol/alcohol_table.dart';
import 'package:angelshare_app/features/menu_catalog/data/datasources/local/drift/tables/alcohol/alcohol_detail_table.dart';

part 'alcohol_dao.g.dart';

@DriftAccessor(tables: [AlcoholTable, AlcoholDetailTable])
class AlcoholDao extends DatabaseAccessor<AppDatabase> with _$AlcoholDaoMixin {
  AlcoholDao(super.db);

  Future<List<AlcoholTableData>> getCocktailsByCategory({required String category}) {
    return (select(alcoholTable)..where((tbl) => tbl.strCategory.equals(category))).get();
  }

  Future<void> insertCocktails({required List<AlcoholTableData> cocktails}) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(alcoholTable, cocktails);
    });
  }

  Future<void> deleteCocktailsByCategory({required String category}) async {
    await (delete(alcoholTable)..where((tbl) => tbl.strCategory.equals(category))).go();
  }

  Future<AlcoholDetailTableData?> getCocktailDetail({required String id}) {
    return (select(alcoholDetailTable)..where((tbl) => tbl.idDrink.equals(id))).getSingleOrNull();
  }

  Future<void> insertCocktailDetail({required AlcoholDetailTableData detail}) async {
    await into(alcoholDetailTable).insertOnConflictUpdate(detail);
  }
}
