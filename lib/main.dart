import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medicine_reminder/core/di/service_locator.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/core/services/shared_refernces_singletone.dart';
import 'package:medicine_reminder/core/theme/app_theme.dart';
import 'package:medicine_reminder/core/theme/cubit/theme_cubit.dart';
import 'package:medicine_reminder/features/home/domain/use_cases/get_medicines_use_case.dart';
import 'package:medicine_reminder/features/home/presentation/manager/get_all_medicines_cubit/get_all_medicines_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';
import 'package:medicine_reminder/my_block_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedReferncesSingletone.init();

  setUp();
  Bloc.observer = MyBlockObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create: (context) => GetAllMedicinesCubit(
            getMedicinesUseCase: getIt<GetMedicinesUseCase>(),
          )..getAllMedicines(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  DateTime _lastKnownDate = DateUtils.dateOnly(DateTime.now());

  Timer? _midnightTimer;

  void _scheduleMidnightRefresh() {
    final now = DateTime.now();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);

    final durationUntilMidnight = nextMidnight.difference(now);
    _midnightTimer = Timer(durationUntilMidnight, () {
      _checkForNewDay();
      _scheduleMidnightRefresh();
    });
  }

  void _checkForNewDay() {
    final currentDate = DateUtils.dateOnly(DateTime.now());

    if (currentDate != _lastKnownDate) {
      _lastKnownDate = currentDate;
      context.read<GetAllMedicinesCubit>().getAllMedicines();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scheduleMidnightRefresh();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _checkForNewDay();
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _midnightTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state,
          locale: const Locale('ar'),
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
