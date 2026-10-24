import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/widgets/adaptive_layout.dart';
import 'package:medicine_reminder/features/onboarding/presentation/views/widgets/on_boarding_mobile_view_body.dart';
import 'package:medicine_reminder/features/onboarding/presentation/views/widgets/on_boarding_tablet_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: const OnBoardingMobileViewBody(),
                ),
              );
            },
          );
        },
        tabletLayout: (context) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: const OnBoardingTabletViewBody(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
