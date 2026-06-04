import 'package:drift/drift.dart';

@DataClassName('OrderHistoryTableData')
class OrderHistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idDrink => text()();
  TextColumn get strDrink => text()();
  TextColumn get strDrinkThumb => text().nullable()();
  IntColumn get quantity => integer()();
  DateTimeColumn get orderedAt => dateTime().withDefault(currentDateAndTime)();
}
