import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:angelshare_app/core/database/daos/ui_widget_dao.dart';
import 'package:angelshare_app/core/providers/ui_widget_models.dart';
import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';

class UiConfigNotifier extends StateNotifier<List<BaseWidgetConfig>> {
  final UiWidgetDao _uiWidgetDao;

  UiConfigNotifier(this._uiWidgetDao) : super([]) {
    init();
  }

  Future<void> init() async {
    await _uiWidgetDao.seedDefaultConfigs();
    await loadConfigs();
  }

  Future<void> loadConfigs() async {
    final list = await _uiWidgetDao.getAllConfigs();
    state = list.map((db) => WidgetConfigFactory.create(db)).toList();
  }

  Future<void> toggleWidget(String id, bool enabled) async {
    if (state.isEmpty) return;
    final item = state.firstWhere((w) => w.id == id);
    final updated = item.toDb().copyWith(isEnabled: enabled);
    await _uiWidgetDao.updateConfig(updated);
    await loadConfigs();
  }

  Future<void> updateWidgetColorSlot(String id, String slot) async {
    if (state.isEmpty) return;
    final item = state.firstWhere((w) => w.id == id);
    final updated = item.toDb().copyWith(colorSlot: slot);
    await _uiWidgetDao.updateConfig(updated);
    await loadConfigs();
  }

  Future<void> updateWidgetPosition(String id, int sortOrder) async {
    if (state.isEmpty) return;
    final item = state.firstWhere((w) => w.id == id);
    final updated = item.toDb().copyWith(sortOrder: sortOrder);
    await _uiWidgetDao.updateConfig(updated);
    await loadConfigs();
  }

  Future<void> updateWidgetMetadata(String id, Map<String, dynamic> metadata) async {
    if (state.isEmpty) return;
    final item = state.firstWhere((w) => w.id == id);
    final updated = item.toDb().copyWith(metadata: Value(jsonEncode(metadata)));
    await _uiWidgetDao.updateConfig(updated);
    await loadConfigs();
  }

  Map<String, dynamic> getMetadata(String id) {
    if (state.isEmpty) return {};
    try {
      final config = state.firstWhere((w) => w.id == id);
      return jsonDecode(config.metadataJson) as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }

  String getThemePreset() {
    if (state.isEmpty) return 'gold';
    final config = state.firstWhere(
      (w) => w.id == 'theme_preset',
      orElse: () => const ThemePresetConfig(
        id: 'theme_preset',
        name: 'Theme Preset',
        isEnabled: true,
        sortOrder: 0,
        colorSlot: 'primary',
        preset: 'gold',
      ),
    );
    if (config is ThemePresetConfig) {
      return config.preset;
    }
    return 'gold';
  }

  Future<void> updateThemePreset(String preset) async {
    await updateWidgetMetadata('theme_preset', {'preset': preset});
  }

  Map<String, String> getCustomColors() {
    if (state.isEmpty) return {};
    try {
      final config = state.firstWhere((w) => w.id == 'theme_preset');
      if (config is ThemePresetConfig && config.preset == 'custom') {
        return {
          'primary': config.primaryColor ?? '#C5A059',
          'accent': config.accentColor ?? '#E5C287',
          'muted': config.mutedColor ?? '#8A6E3B',
          'backgroundObsidian': config.backgroundObsidianColor ?? '#050505',
          'backgroundDeep': config.backgroundDeepColor ?? '#0E0E0E',
        };
      }
    } catch (_) {}
    return {};
  }
}

final uiWidgetDaoProvider = Provider<UiWidgetDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.uiWidgetDao;
});

final uiConfigProvider = StateNotifierProvider<UiConfigNotifier, List<BaseWidgetConfig>>((ref) {
  final dao = ref.watch(uiWidgetDaoProvider);
  return UiConfigNotifier(dao);
});

final currentUserEmailProvider = StateProvider<String?>((ref) => null);
