import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/core/di/service_locator.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/add_medicine_view.dart';
import 'package:medicine_reminder/features/analytics/presentation/views/analytics_view.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/views/edit_medicine_view.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/home/data/models/medicine_does_data.dart';
import 'package:medicine_reminder/features/home/presentation/views/home_view.dart';
import 'package:medicine_reminder/features/main/presentation/views/main_view.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/manager/get_medicine_details_cubit/get_medicine_details_cubit.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/medicine_details_view.dart';
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
  static const editMedicineView = '/editMedicineView';
  static const medicineDetailsView = '/medicineDetailsView';
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
      GoRoute(
        path: editMedicineView,
        builder: (context, state) {
          return EditMedicineView(homeMedicineModel : state.extra as HomeMedicineModel,);
        },
      ),
     GoRoute(
  path: AppRoutes.medicineDetailsView,
  builder: (context, state) {
    final dose = state.extra as MedicineDoseData;

    return BlocProvider(
      create: (context) => getIt<GetMedicineDetailsCubit>()
        ..getMedicineDetails(
          medicineId: dose.medicine.medicine.id!,
        ),
      child: const MedicineDetailsView(),
    );
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
