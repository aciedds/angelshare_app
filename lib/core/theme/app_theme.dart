import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const Color backgroundObsidian = Color(0xFF050505); // Jet black
  static const Color backgroundDeep = Color(0xFF0E0E0E); // Deep premium charcoal

  // Premium Gold & Monochromatic Palette
  static const Color goldPrimary = Color(0xFFC5A059); // Metallic gold
  static const Color goldAccent = Color(0xFFE5C287); // Warm light champagne gold
  static const Color goldMuted = Color(0xFF8A6E3B); // Dark bronze gold

  static const Color glassWhite = Color(0x0EFFFFFF);
  static const Color glassBorder = Color(0x1BFFFFFF);
  static const Color glassShadow = Color(0x3F000000);

  // Backward compatibility mappings
  @Deprecated('Use goldPrimary instead')
  static const Color neonPurple = goldPrimary;
  @Deprecated('Use goldAccent instead')
  static const Color neonCyan = goldAccent;
  @Deprecated('Use goldMuted instead')
  static const Color neonMagenta = goldMuted;

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundObsidian,
      primaryColor: goldPrimary,
      colorScheme: const ColorScheme.dark(
        primary: goldPrimary,
        secondary: goldAccent,
        tertiary: goldMuted,
        surface: backgroundDeep,
        error: Colors.redAccent,
      ),
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
        prefixIconColor: goldAccent,
        suffixIconColor: goldAccent,
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
          borderSide: const BorderSide(color: goldAccent, width: 1.5),
        ),
      ),
    );
  }
}
