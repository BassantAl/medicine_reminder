import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      manageNavigation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: Center(child: SingleChildScrollView(child: SplashViewBody()))));
  }

  void manageNavigation() {
    GoRouter.of(context).pushReplacement(AppRoutes.onboardingView);
  }
}
