import 'package:drift/drift.dart';

@DataClassName('CartTableData')
class CartTable extends Table {
  TextColumn get idDrink => text()();
  TextColumn get strDrink => text()();
  TextColumn get strDrinkThumb => text().nullable()();
  IntColumn get quantity => integer()();
  IntColumn get price => integer()(); // Price in cyber-mana

  @override
  Set<Column> get primaryKey => {idDrink};
}
