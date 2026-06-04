import 'package:drift/drift.dart';
import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/features/favorites/data/datasources/local/drift/tables/favorite_table.dart';

part 'favorites_dao.g.dart';

@DriftAccessor(tables: [FavoriteTable])
class FavoritesDao extends DatabaseAccessor<AppDatabase> with _$FavoritesDaoMixin {
  FavoritesDao(super.db);

  Future<List<FavoriteTableData>> getFavorites() {
    return (select(favoriteTable)
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.addedAt, mode: OrderingMode.desc)
          ]))
        .get();
  }

  Future<void> addFavorite({required FavoriteTableData favorite}) async {
    await into(favoriteTable).insertOnConflictUpdate(favorite);
  }

  Future<void> removeFavorite({required String idDrink}) async {
    await (delete(favoriteTable)..where((tbl) => tbl.idDrink.equals(idDrink))).go();
  }

  Future<bool> isFavorite({required String idDrink}) async {
    final record = await (select(favoriteTable)..where((tbl) => tbl.idDrink.equals(idDrink))).getSingleOrNull();
    return record != null;
  }
}
