import 'dart:convert';
import 'package:angelshare_app/core/database/app_database.dart';

abstract class BaseWidgetConfig {
  final String id;
  final String name;
  final bool isEnabled;
  final int sortOrder;
  final String colorSlot;

  const BaseWidgetConfig({
    required this.id,
    required this.name,
    required this.isEnabled,
    required this.sortOrder,
    required this.colorSlot,
  });

  String get metadataJson;

  UiWidgetConfig toDb() {
    return UiWidgetConfig(
      id: id,
      name: name,
      isEnabled: isEnabled,
      sortOrder: sortOrder,
      colorSlot: colorSlot,
      metadata: metadataJson,
    );
  }
}

class ThemePresetConfig extends BaseWidgetConfig {
  final String preset;
  final String? primaryColor;
  final String? accentColor;
  final String? mutedColor;
  final String? backgroundObsidianColor;
  final String? backgroundDeepColor;

  const ThemePresetConfig({
    required super.id,
    required super.name,
    required super.isEnabled,
    required super.sortOrder,
    required super.colorSlot,
    required this.preset,
    this.primaryColor,
    this.accentColor,
    this.mutedColor,
    this.backgroundObsidianColor,
    this.backgroundDeepColor,
  });

  factory ThemePresetConfig.fromDb(UiWidgetConfig db) {
    final Map<String, dynamic> meta = jsonDecode(db.metadata ?? '{}');
    return ThemePresetConfig(
      id: db.id,
      name: db.name,
      isEnabled: db.isEnabled,
      sortOrder: db.sortOrder,
      colorSlot: db.colorSlot,
      preset: meta['preset'] as String? ?? 'gold',
      primaryColor: meta['primary'] as String?,
      accentColor: meta['accent'] as String?,
      mutedColor: meta['muted'] as String?,
      backgroundObsidianColor: meta['backgroundObsidian'] as String?,
      backgroundDeepColor: meta['backgroundDeep'] as String?,
    );
  }

  @override
  String get metadataJson {
    return jsonEncode({
      'preset': preset,
      if (primaryColor != null) 'primary': primaryColor,
      if (accentColor != null) 'accent': accentColor,
      if (mutedColor != null) 'muted': mutedColor,
      if (backgroundObsidianColor != null) 'backgroundObsidian': backgroundObsidianColor,
      if (backgroundDeepColor != null) 'backgroundDeep': backgroundDeepColor,
    });
  }
}

class WelcomeHeaderConfig extends BaseWidgetConfig {
  final String title;

  const WelcomeHeaderConfig({
    required super.id,
    required super.name,
    required super.isEnabled,
    required super.sortOrder,
    required super.colorSlot,
    required this.title,
  });

  factory WelcomeHeaderConfig.fromDb(UiWidgetConfig db) {
    final Map<String, dynamic> meta = jsonDecode(db.metadata ?? '{}');
    return WelcomeHeaderConfig(
      id: db.id,
      name: db.name,
      isEnabled: db.isEnabled,
      sortOrder: db.sortOrder,
      colorSlot: db.colorSlot,
      title: meta['title'] as String? ?? "ANGEL'S SHARE",
    );
  }

  @override
  String get metadataJson => jsonEncode({'title': title});
}

class AmbientOrbsConfig extends BaseWidgetConfig {
  final bool showOrbs;

  const AmbientOrbsConfig({
    required super.id,
    required super.name,
    required super.isEnabled,
    required super.sortOrder,
    required super.colorSlot,
    required this.showOrbs,
  });

  factory AmbientOrbsConfig.fromDb(UiWidgetConfig db) {
    final Map<String, dynamic> meta = jsonDecode(db.metadata ?? '{}');
    return AmbientOrbsConfig(
      id: db.id,
      name: db.name,
      isEnabled: db.isEnabled,
      sortOrder: db.sortOrder,
      colorSlot: db.colorSlot,
      showOrbs: meta['showOrbs'] as bool? ?? true,
    );
  }

  @override
  String get metadataJson => jsonEncode({'showOrbs': showOrbs});
}

class CategoriesSliderConfig extends BaseWidgetConfig {
  const CategoriesSliderConfig({
    required super.id,
    required super.name,
    required super.isEnabled,
    required super.sortOrder,
    required super.colorSlot,
  });

  factory CategoriesSliderConfig.fromDb(UiWidgetConfig db) {
    return CategoriesSliderConfig(
      id: db.id,
      name: db.name,
      isEnabled: db.isEnabled,
      sortOrder: db.sortOrder,
      colorSlot: db.colorSlot,
    );
  }

  @override
  String get metadataJson => '{}';
}

class CocktailCatalogConfig extends BaseWidgetConfig {
  final String layoutType;

  const CocktailCatalogConfig({
    required super.id,
    required super.name,
    required super.isEnabled,
    required super.sortOrder,
    required super.colorSlot,
    required this.layoutType,
  });

  factory CocktailCatalogConfig.fromDb(UiWidgetConfig db) {
    final Map<String, dynamic> meta = jsonDecode(db.metadata ?? '{}');
    return CocktailCatalogConfig(
      id: db.id,
      name: db.name,
      isEnabled: db.isEnabled,
      sortOrder: db.sortOrder,
      colorSlot: db.colorSlot,
      layoutType: meta['layoutType'] as String? ?? 'carousel',
    );
  }

  @override
  String get metadataJson => jsonEncode({'layoutType': layoutType});
}

class DrinkSelectorConfig extends BaseWidgetConfig {
  const DrinkSelectorConfig({
    required super.id,
    required super.name,
    required super.isEnabled,
    required super.sortOrder,
    required super.colorSlot,
  });

  factory DrinkSelectorConfig.fromDb(UiWidgetConfig db) {
    return DrinkSelectorConfig(
      id: db.id,
      name: db.name,
      isEnabled: db.isEnabled,
      sortOrder: db.sortOrder,
      colorSlot: db.colorSlot,
    );
  }

  @override
  String get metadataJson => '{}';
}

class SynthesizerConfig extends BaseWidgetConfig {
  final String? category;

  const SynthesizerConfig({
    required super.id,
    required super.name,
    required super.isEnabled,
    required super.sortOrder,
    required super.colorSlot,
    this.category,
  });

  factory SynthesizerConfig.fromDb(UiWidgetConfig db) {
    final Map<String, dynamic> meta = jsonDecode(db.metadata ?? '{}');
    return SynthesizerConfig(
      id: db.id,
      name: db.name,
      isEnabled: db.isEnabled,
      sortOrder: db.sortOrder,
      colorSlot: db.colorSlot,
      category: meta['category'] as String?,
    );
  }

  @override
  String get metadataJson => jsonEncode({'category': category});
}

class GenericWidgetConfig extends BaseWidgetConfig {
  final String? rawMetadata;

  const GenericWidgetConfig({
    required super.id,
    required super.name,
    required super.isEnabled,
    required super.sortOrder,
    required super.colorSlot,
    this.rawMetadata,
  });

  factory GenericWidgetConfig.fromDb(UiWidgetConfig db) {
    return GenericWidgetConfig(
      id: db.id,
      name: db.name,
      isEnabled: db.isEnabled,
      sortOrder: db.sortOrder,
      colorSlot: db.colorSlot,
      rawMetadata: db.metadata,
    );
  }

  @override
  String get metadataJson => rawMetadata ?? '{}';
}

class WidgetConfigFactory {
  static BaseWidgetConfig create(UiWidgetConfig db) {
    switch (db.id) {
      case 'theme_preset':
        return ThemePresetConfig.fromDb(db);
      case 'welcome_header':
        return WelcomeHeaderConfig.fromDb(db);
      case 'ambient_orbs':
        return AmbientOrbsConfig.fromDb(db);
      case 'categories_slider':
        return CategoriesSliderConfig.fromDb(db);
      case 'cocktail_catalog':
        return CocktailCatalogConfig.fromDb(db);
      case 'drink_selector':
        return DrinkSelectorConfig.fromDb(db);
      case 'synthesizer':
        return SynthesizerConfig.fromDb(db);
      default:
        return GenericWidgetConfig.fromDb(db);
    }
  }
}
