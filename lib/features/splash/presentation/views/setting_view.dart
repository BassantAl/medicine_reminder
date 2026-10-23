import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/core/theme/cubit/theme_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('hello')),
      body: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return RadioGroup(
            groupValue: state,
            onChanged: (mode) {
              if (mode != null) {
                context.read<ThemeCubit>().changeTheme(mode);
              }
            },
            child: Column(
              children: [
                RadioListTile(
                  title: Text('System Default'),
                  value: ThemeMode.system,
                ),
                RadioListTile(
                  title: Text('Light Mode'),
                  value: ThemeMode.light,
                ),
                RadioListTile(title: Text('Dark Mode'), value: ThemeMode.dark),
              ],
            ),
          );
        },
      ),
    );
  }
}
