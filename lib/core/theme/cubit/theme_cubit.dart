
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/core/services/shared_refernces_singletone.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(_getInitialTheme());

  static const String _themeKey = 'theme_mode';

  static ThemeMode _getInitialTheme() {
    final savedTheme = SharedReferncesSingletone.getString(
      key: _themeKey,
    );

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == savedTheme,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> changeTheme(ThemeMode mode)async  {
    await SharedReferncesSingletone.setString(
      key: _themeKey,
      value: mode.name,
    );

    emit(mode);
  }
}

