import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const onboardingView = '/onboardingView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return SplashView();
        },
      ),
    ],
  );
}
