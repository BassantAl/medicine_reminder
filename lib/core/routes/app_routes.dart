import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/add_medicine_view.dart';
import 'package:medicine_reminder/features/analytics/presentation/views/analytics_view.dart';
import 'package:medicine_reminder/features/home/presentation/views/home_view.dart';
import 'package:medicine_reminder/features/main/presentation/views/main_view.dart';
import 'package:medicine_reminder/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:medicine_reminder/features/settings/presentation/views/settings_view.dart';
import 'package:medicine_reminder/features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const onboardingView = '/onboardingView';
  static const mainView = '/mainView';
  static const homeView = '/homeView';
  static const analyticsView = '/analyticsView';
  static const settingsView = '/settingsView';
  static const addMedicineView = '/addMedicineView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return SplashView();
        },
      ),
      GoRoute(
        path: onboardingView,
        builder: (context, state) {
          return OnboardingView();
        },
      ),
      GoRoute(
        path: addMedicineView,
        builder: (context, state) {
          return AddMedicineView();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainView(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: homeView,
                builder: (context, state) {
                  return HomeView();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: analyticsView,
                builder: (context, state) {
                  return AnalyticsView();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: settingsView,
                builder: (context, state) {
                  return SettingsView();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
