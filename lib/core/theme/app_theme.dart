import 'package:flutter/material.dart';

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color backgroundObsidian;
  final Color backgroundDeep;
  final Color primary;
  final Color accent;
  final Color muted;
  final Color glassWhite;
  final Color glassBorder;
  final Color glassShadow;

  const AppThemeColors({
    required this.backgroundObsidian,
    required this.backgroundDeep,
    required this.primary,
    required this.accent,
    required this.muted,
    required this.glassWhite,
    required this.glassBorder,
    required this.glassShadow,
  });

  @override
  ThemeExtension<AppThemeColors> copyWith({
    Color? backgroundObsidian,
    Color? backgroundDeep,
    Color? primary,
    Color? accent,
    Color? muted,
    Color? glassWhite,
    Color? glassBorder,
    Color? glassShadow,
  }) {
    return AppThemeColors(
      backgroundObsidian: backgroundObsidian ?? this.backgroundObsidian,
      backgroundDeep: backgroundDeep ?? this.backgroundDeep,
      primary: primary ?? this.primary,
      accent: accent ?? this.accent,
      muted: muted ?? this.muted,
      glassWhite: glassWhite ?? this.glassWhite,
      glassBorder: glassBorder ?? this.glassBorder,
      glassShadow: glassShadow ?? this.glassShadow,
    );
  }

  @override
  ThemeExtension<AppThemeColors> lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) return this;
    return AppThemeColors(
      backgroundObsidian: Color.lerp(backgroundObsidian, other.backgroundObsidian, t)!,
      backgroundDeep: Color.lerp(backgroundDeep, other.backgroundDeep, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      glassWhite: Color.lerp(glassWhite, other.glassWhite, t)!,
      glassBorder: Color.lerp(glassBorder, other.glassBorder, t)!,
      glassShadow: Color.lerp(glassShadow, other.glassShadow, t)!,
    );
  }
}

class AppTheme {
  const AppTheme._();

  // --- 1. OBSIDIAN GOLD PRESET ---
  static const Color goldObsidian = Color(0xFF050505);
  static const Color goldDeep = Color(0xFF0E0E0E);
  static const Color goldPrimary = Color(0xFFC5A059);
  static const Color goldAccent = Color(0xFFE5C287);
  static const Color goldMuted = Color(0xFF8A6E3B);

  // --- 2. NEON CYBERPUNK PRESET ---
  static const Color cyberpunkObsidian = Color(0xFF0A0915);
  static const Color cyberpunkDeep = Color(0xFF131127);
  static const Color cyberpunkPrimary = Color(0xFF9D4EDD);
  static const Color cyberpunkAccent = Color(0xFF00F5D4);
  static const Color cyberpunkMuted = Color(0xFF5A189A);

  // --- 3. DEEP EMERALD PRESET ---
  static const Color emeraldObsidian = Color(0xFF0A1C18);
  static const Color emeraldDeep = Color(0xFF112D27);
  static const Color emeraldPrimary = Color(0xFFD4A373);
  static const Color emeraldAccent = Color(0xFFE9C46A);
  static const Color emeraldMuted = Color(0xFF588157);

  // General glass styles
  static const Color glassWhite = Color(0x0EFFFFFF);
  static const Color glassBorder = Color(0x1BFFFFFF);
  static const Color glassShadow = Color(0x3F000000);

  // Deprecated backward compatibility mappings
  static const Color backgroundObsidian = goldObsidian;
  static const Color backgroundDeep = goldDeep;
  
  @Deprecated('Use goldPrimary instead')
  static const Color neonPurple = goldPrimary;
  @Deprecated('Use goldAccent instead')
  static const Color neonCyan = goldAccent;
  @Deprecated('Use goldMuted instead')
  static const Color neonMagenta = goldMuted;

  // Obsidian Gold Theme Builder
  static ThemeData get goldTheme {
    return _buildTheme(
      brightness: Brightness.dark,
      backgroundObsidian: goldObsidian,
      backgroundDeep: goldDeep,
      primaryColor: goldPrimary,
      accentColor: goldAccent,
      mutedColor: goldMuted,
    );
  }

  // Neon Cyberpunk Theme Builder
  static ThemeData get cyberpunkTheme {
    return _buildTheme(
      brightness: Brightness.dark,
      backgroundObsidian: cyberpunkObsidian,
      backgroundDeep: cyberpunkDeep,
      primaryColor: cyberpunkPrimary,
      accentColor: cyberpunkAccent,
      mutedColor: cyberpunkMuted,
    );
  }

  // Deep Emerald Theme Builder
  static ThemeData get emeraldTheme {
    return _buildTheme(
      brightness: Brightness.dark,
      backgroundObsidian: emeraldObsidian,
      backgroundDeep: emeraldDeep,
      primaryColor: emeraldPrimary,
      accentColor: emeraldAccent,
      mutedColor: emeraldMuted,
    );
  }

  // Custom Theme Builder for User-customized colors
  static ThemeData buildCustomTheme({
    required Color primary,
    required Color accent,
    required Color muted,
    required Color backgroundObsidian,
    required Color backgroundDeep,
  }) {
    return _buildTheme(
      brightness: Brightness.dark,
      backgroundObsidian: backgroundObsidian,
      backgroundDeep: backgroundDeep,
      primaryColor: primary,
      accentColor: accent,
      mutedColor: muted,
    );
  }

  // Backward compatibility alias for main.dart
  static ThemeData get darkTheme => goldTheme;

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color backgroundObsidian,
    required Color backgroundDeep,
    required Color primaryColor,
    required Color accentColor,
    required Color mutedColor,
  }) {
    final baseColorScheme = ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor,
      tertiary: mutedColor,
      surface: backgroundDeep,
      error: Colors.redAccent,
    );

    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: backgroundObsidian,
      primaryColor: primaryColor,
      colorScheme: baseColorScheme,
      extensions: [
        AppThemeColors(
          backgroundObsidian: backgroundObsidian,
          backgroundDeep: backgroundDeep,
          primary: primaryColor,
          accent: accentColor,
          muted: mutedColor,
          glassWhite: glassWhite,
          glassBorder: glassBorder,
          glassShadow: glassShadow,
        ),
      ],
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.5,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          color: Colors.white,
          letterSpacing: 2,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Color(0xFFE5E5E5),
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Color(0xFFA0A0A0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: glassWhite,
        hintStyle: const TextStyle(color: Color(0x80CCCCCC)),
        prefixIconColor: accentColor,
        suffixIconColor: accentColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: glassBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: glassBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: accentColor, width: 1.5),
        ),
      ),
    );
  }
}
