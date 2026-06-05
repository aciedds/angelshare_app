import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'package:angelshare_app/features/menu_catalog/data/datasources/local/drift/tables/alcohol/alcohol_table.dart';
import 'package:angelshare_app/features/menu_catalog/data/datasources/local/drift/tables/alcohol/alcohol_detail_table.dart';
import 'package:angelshare_app/features/menu_catalog/data/datasources/local/drift/daos/alcohol_dao.dart';
import 'package:angelshare_app/features/cart/data/datasources/local/drift/tables/cart_table.dart';
import 'package:angelshare_app/features/cart/data/datasources/local/drift/tables/order_history_table.dart';
import 'package:angelshare_app/features/cart/data/datasources/local/drift/daos/cart_dao.dart';
import 'package:angelshare_app/features/favorites/data/datasources/local/drift/tables/favorite_table.dart';
import 'package:angelshare_app/features/favorites/data/datasources/local/drift/daos/favorites_dao.dart';
import 'package:angelshare_app/core/database/tables/ui_widget_table.dart';
import 'package:angelshare_app/core/database/daos/ui_widget_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    AlcoholTable,
    AlcoholDetailTable,
    CartTable,
    OrderHistoryTable,
    FavoriteTable,
    UiWidgetTable,
  ],
  daos: [
    AlcoholDao,
    CartDao,
    FavoritesDao,
    UiWidgetDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (migrator, from, to) async {
        if (from < 2) {
          await migrator.createTable(cartTable);
          await migrator.createTable(orderHistoryTable);
          await migrator.createTable(favoriteTable);
        }
        if (from < 3) {
          await migrator.createTable(uiWidgetTable);
        }
      },
    );
  }
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    
    // SQLite Flutter libs workaround for Android
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    
    return NativeDatabase.createInBackground(file);
  });
}
