import 'package:flutter/material.dart';

/// Design system tokens — zero hardcode principle.
///
/// Literal values only allowed here (and flavor/env config).
/// Widgets must reference these tokens or `Theme.of(context)`.
class DesignTokens {
  // ── Brand / Primary ──────────────────────────────────────
  static const Color primary50 = Color(0xFFecfdf5);
  static const Color primary100 = Color(0xFFd1fae5);
  static const Color primary200 = Color(0xFFa7f3d0);
  static const Color primary300 = Color(0xFF6ee7b7);
  static const Color primary400 = Color(0xFF4edea3);
  static const Color primary500 = Color(0xFF10b981);
  static const Color primary600 = Color(0xFF006c49);
  static const Color primary700 = Color(0xFF005236);
  static const Color primary800 = Color(0xFF00422b);
  static const Color primary900 = Color(0xFF002113);

  // ── Surface Tones ────────────────────────────────────────
  static const Color surfaceBase = Color(0xFFf4fbf4);
  static const Color surfaceDim = Color(0xFFd4dcd5);
  static const Color surfaceLowest = Color(0xFFffffff);

  // ── Semantic ─────────────────────────────────────────────
  static const Color success = Color(0xFF10b981);
  static const Color warning = Color(0xFFf59e0b);
  static const Color danger = Color(0xFFba1a1a);
  static const Color info = Color(0xFF3b82f6);

  // ── Text ─────────────────────────────────────────────────
  static const Color textOnSurface = Color(0xFF161d19);
  static const Color textOnSurfaceVariant = Color(0xFF3c4a42);
  static const Color textInverseSurface = Color(0xFF2b322d);
  static const Color textOutline = Color(0xFF6c7a71);

  // ── Typography Scale ─────────────────────────────────────
  static const double textH1 = 28.0;
  static const double textH2 = 20.0;
  static const double textBody = 14.0;
  static const double textBodySm = 12.0;

  // ── Spacing Scale (4px base) ────────────────────────────
  static const double spaceXs = 4.0;
  static const double spaceSm = 8.0;
  static const double spaceMd = 12.0;
  static const double spaceLg = 16.0;
  static const double spaceXl = 24.0;
  static const double spaceXxl = 32.0;

  // ── Radius ───────────────────────────────────────────────
  static const double radiusSm = 4.0;
  static const double radiusDefault = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusFull = 999.0;

  // ── Icon Sizes ───────────────────────────────────────────
  static const double iconSm = 16.0;
  static const double iconMd = 20.0;
  static const double iconLg = 24.0;

  // ── Accessibility ────────────────────────────────────────
  static const double minTapTarget = 48.0;

  // ── Border Width ─────────────────────────────────────────
  static const double borderWidthThin = 1.0;
  static const double borderWidthFocus = 2.0;

  // ── Motion ───────────────────────────────────────────────
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);

  // ── Network ──────────────────────────────────────────────
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
}
