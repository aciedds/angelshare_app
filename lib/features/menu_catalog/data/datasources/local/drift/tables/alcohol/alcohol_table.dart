import 'package:drift/drift.dart';

@DataClassName('AlcoholTableData')
class AlcoholTable extends Table {
  TextColumn get idDrink => text()();
  TextColumn get strDrink => text()();
  TextColumn get strDrinkThumb => text().nullable()();
  TextColumn get strCategory => text()();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {idDrink};
}
