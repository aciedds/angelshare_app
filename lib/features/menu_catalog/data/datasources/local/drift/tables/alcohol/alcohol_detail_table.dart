import 'dart:convert';
import 'package:drift/drift.dart';

class IngredientTableItem {
  final String name;
  final String measure;

  IngredientTableItem({
    required this.name,
    required this.measure,
  });

  factory IngredientTableItem.fromJson(Map<String, dynamic> json) {
    return IngredientTableItem(
      name: json['name'] as String? ?? '',
      measure: json['measure'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'measure': measure,
    };
  }
}

class IngredientsConverter extends TypeConverter<List<IngredientTableItem>, String> {
  const IngredientsConverter();

  @override
  List<IngredientTableItem> fromSql(String fromDb) {
    try {
      final list = jsonDecode(fromDb) as List;
      return list
          .map((item) => IngredientTableItem.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  @override
  String toSql(List<IngredientTableItem> value) {
    return jsonEncode(value.map((item) => item.toJson()).toList());
  }
}

@DataClassName('AlcoholDetailTableData')
class AlcoholDetailTable extends Table {
  TextColumn get idDrink => text()();
  TextColumn get strDrink => text()();
  TextColumn get strDrinkThumb => text().nullable()();
  TextColumn get strCategory => text()();
  TextColumn get strGlass => text()();
  TextColumn get strAlcoholic => text()();
  TextColumn get strInstructions => text()();
  TextColumn get ingredients => text().map(const IngredientsConverter())();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {idDrink};
}
