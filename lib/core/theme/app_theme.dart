import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/medicine_status_colors.dart';

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
      secondary: AppColorsLight.primaryLight,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorsLight.background,
      foregroundColor: AppColorsLight.heading,
      elevation: 0,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColorsLight.heading),
      bodyLarge: TextStyle(color: AppColorsLight.textPrimary),
      bodyMedium: TextStyle(color: AppColorsLight.textSecondary),
    ),

    dividerColor: AppColorsLight.border,
    extensions: const [
      MedicineStatusColors(
        taken: AppColorsLight.taken,
        pending: AppColorsLight.pending,
        missed: AppColorsLight.missed,
        skipped: AppColorsLight.skipped,
      ),
    ],
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColorsLight.surface,
      selectedItemColor: AppColorsLight.primary,
      unselectedItemColor: AppColorsLight.textSecondary,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColorsDark.background,

    colorScheme: ColorScheme.fromSeed(
      secondary: AppColorsDark.primaryLight,
      seedColor: AppColorsDark.primary,
      brightness: Brightness.dark,
      surface: AppColorsDark.surface,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorsDark.background,
      foregroundColor: AppColorsDark.heading,
      elevation: 0,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColorsDark.heading),
      bodyLarge: TextStyle(color: AppColorsDark.textPrimary),
      bodyMedium: TextStyle(color: AppColorsDark.textSecondary),
    ),

    dividerColor: AppColorsDark.border,
    extensions: const [
      MedicineStatusColors(
        taken: AppColorsDark.taken,
        pending: AppColorsDark.pending,
        missed: AppColorsDark.missed,
        skipped: AppColorsDark.skipped,
      ),
    ],
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColorsDark.surface,
      selectedItemColor: AppColorsDark.primary,
      unselectedItemColor: AppColorsDark.textSecondary,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );
}
