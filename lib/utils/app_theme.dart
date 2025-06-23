import 'package:flutter/material.dart';

/// Central place for defining the application theme.
class AppTheme {
  static const Color primaryColor = Color(0xFFF7931E);

  /// Light theme with Material 3 enabled.
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      fontFamily: 'Sarabun',
    );
  }

  /// Dark theme variant.
  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.dark),
      fontFamily: 'Sarabun',
    );
  }
}
