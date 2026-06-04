import 'package:drift/drift.dart';

@DataClassName('FavoriteTableData')
class FavoriteTable extends Table {
  TextColumn get idDrink => text()();
  TextColumn get strDrink => text()();
  TextColumn get strDrinkThumb => text().nullable()();
  TextColumn get strCategory => text()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {idDrink};
}
