import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/core/services/shared_refernces_singletone.dart';
import 'package:medicine_reminder/core/theme/app_theme.dart';
import 'package:medicine_reminder/core/theme/cubit/theme_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedReferncesSingletone.init();

  runApp(
    // BlocProvider(
    //   create: (context) => ThemeCubit(preferences),
    //   child: DevicePreview(
    //   enabled: true,
    //   builder:(context)=> const MyApp()),
    // )
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state,
          locale: Locale('en'),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routerConfig: AppRoutes.router,
        );
      },
    );
  }
}
