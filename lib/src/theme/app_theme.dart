import 'package:flutter/material.dart';

import 'package:moe_flutter_core/src/constants/design_tokens.dart';

/// Theme builder for MOE Flutter ecosystem.
///
/// Supports dynamic primary color injection for white-label builds.
class MoeAppTheme {
  /// Hex string to Color converter.
  static Color colorFromHex(String hexColor) {
    String hex = hexColor.replaceAll('#', '');
    if (hex.isEmpty) hex = '006c49';
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }

  /// Build light theme from primary color hex.
  static ThemeData buildTheme({required String primaryColorHex}) {
    final Color primaryColor = colorFromHex(primaryColorHex);

    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      surface: DesignTokens.surfaceLowest,
      onSurface: DesignTokens.textOnSurface,
      error: DesignTokens.danger,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: DesignTokens.surfaceBase,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: DesignTokens.textH1,
          fontWeight: FontWeight.bold,
          color: DesignTokens.textOnSurface,
        ),
        headlineMedium: TextStyle(
          fontSize: DesignTokens.textH2,
          fontWeight: FontWeight.bold,
          color: DesignTokens.textOnSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: DesignTokens.textBody,
          color: DesignTokens.textOnSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: DesignTokens.textBodySm,
          color: DesignTokens.textOnSurfaceVariant,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: DesignTokens.surfaceLowest,
        foregroundColor: DesignTokens.textOnSurface,
        elevation: 0,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusDefault),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.spaceLg,
            vertical: DesignTokens.spaceMd,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: DesignTokens.surfaceLowest,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMd),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DesignTokens.surfaceLowest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusDefault),
          borderSide: const BorderSide(color: DesignTokens.textOutline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusDefault),
          borderSide: const BorderSide(color: DesignTokens.textOutline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusDefault),
          borderSide: BorderSide(
            color: primaryColor,
            width: DesignTokens.borderWidthFocus,
          ),
        ),
      ),
    );
  }

  /// Build dark theme variant.
  static ThemeData buildDarkTheme({required String primaryColorHex}) {
    final Color primaryColor = colorFromHex(primaryColorHex);

    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      brightness: Brightness.dark,
      error: DesignTokens.danger,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: DesignTokens.textInverseSurface,
      brightness: Brightness.dark,
    );
  }
}
