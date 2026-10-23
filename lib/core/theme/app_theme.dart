
import 'package:flutter/material.dart';
import 'app_colors_light.dart';
import 'app_colors_dark.dart';

abstract final class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColorsLight.background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColorsLight.primary,
      brightness: Brightness.light,
      surface: AppColorsLight.surface,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorsLight.background,
      foregroundColor: AppColorsLight.heading,
      elevation: 0,
    ),

    dividerColor: AppColorsLight.border,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColorsDark.background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColorsDark.primary,
      brightness: Brightness.dark,
      surface: AppColorsDark.surface,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorsDark.background,
      foregroundColor: AppColorsDark.heading,
      elevation: 0,
    ),

    dividerColor: AppColorsDark.border,
  );
}
