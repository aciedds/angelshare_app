import 'package:drift/drift.dart';
import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/core/database/tables/ui_widget_table.dart';

part 'ui_widget_dao.g.dart';

@DriftAccessor(tables: [UiWidgetTable])
class UiWidgetDao extends DatabaseAccessor<AppDatabase> with _$UiWidgetDaoMixin {
  UiWidgetDao(super.db);

  Future<List<UiWidgetConfig>> getAllConfigs() {
    return (select(uiWidgetTable)
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.sortOrder),
          ]))
        .get();
  }

  Future<void> updateConfig(UiWidgetConfig config) {
    return update(uiWidgetTable).replace(config);
  }

  Future<void> insertConfig(UiWidgetConfig config) {
    return into(uiWidgetTable).insertOnConflictUpdate(config);
  }

  Future<void> seedDefaultConfigs() async {
    final list = await select(uiWidgetTable).get();
    if (list.isNotEmpty) return;

    final defaults = [
      const UiWidgetConfig(
        id: 'theme_preset',
        name: 'Active Theme Preset',
        isEnabled: true,
        sortOrder: 0,
        colorSlot: 'primary',
        metadata: '{"preset": "gold"}', // Mapped to gold preset
      ),
      const UiWidgetConfig(
        id: 'welcome_header',
        name: 'Welcome Header',
        isEnabled: true,
        sortOrder: 1,
        colorSlot: 'accent',
        metadata: '{"title": "WELCOME TO ANGEL\'S SHARE"}',
      ),
      const UiWidgetConfig(
        id: 'ambient_orbs',
        name: 'Floating Ambient Orbs',
        isEnabled: true,
        sortOrder: 2,
        colorSlot: 'primary',
        metadata: '{"showOrbs": true}',
      ),
      const UiWidgetConfig(
        id: 'categories_slider',
        name: 'Categories Slider',
        isEnabled: true,
        sortOrder: 3,
        colorSlot: 'primary',
        metadata: '{}',
      ),
      const UiWidgetConfig(
        id: 'cocktail_catalog',
        name: 'Cocktail Catalog Gallery',
        isEnabled: true,
        sortOrder: 4,
        colorSlot: 'accent',
        metadata: '{"layoutType": "carousel"}', // Mapped to 3D carousel
      ),
      const UiWidgetConfig(
        id: 'drink_selector',
        name: 'Circular Drink Selector',
        isEnabled: true,
        sortOrder: 5,
        colorSlot: 'primary',
        metadata: '{}',
      ),
      const UiWidgetConfig(
        id: 'synthesizer',
        name: 'Magical Synthesizer Tab Config',
        isEnabled: true,
        sortOrder: 6,
        colorSlot: 'muted',
        metadata: '{"category": null}', // null means any category
      ),
    ];

    for (final config in defaults) {
      await insertConfig(config);
    }
  }
}
