import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this.preferences) : super(_getInitialTheme(preferences));
  final SharedPreferences preferences;

  static const String _themeKey = 'theme_mode';

  static ThemeMode _getInitialTheme(SharedPreferences preferences) {
    final savedTheme = preferences.getString(_themeKey);

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == savedTheme,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> changeTheme(ThemeMode mode) async {
    await preferences.setString(_themeKey, mode.name);
    emit(mode);
  }
}
