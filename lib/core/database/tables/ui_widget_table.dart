import 'package:drift/drift.dart';

@DataClassName('UiWidgetConfig')
class UiWidgetTable extends Table {
  TextColumn get id => text()(); // Identifier: e.g. 'welcome_header', 'categories_slider'
  TextColumn get name => text()(); // Readable name
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))(); // Visibility toggle
  IntColumn get sortOrder => integer()(); // Index in dynamic list
  TextColumn get colorSlot => text().withDefault(const Constant('primary'))(); // 'primary', 'secondary', 'accent', 'muted'
  TextColumn get metadata => text().nullable()(); // JSON configurations (e.g. title text, layoutType, targetCategory)

  @override
  Set<Column> get primaryKey => {id};
}
