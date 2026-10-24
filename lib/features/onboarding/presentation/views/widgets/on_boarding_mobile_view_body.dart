import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/onboarding/presentation/views/widgets/custom_onboarding_page_view.dart';
import 'package:medicine_reminder/features/onboarding/presentation/views/widgets/manage_buttons_apperance.dart';
import 'package:medicine_reminder/features/onboarding/presentation/views/widgets/manage_skip_apperance.dart';

class OnBoardingMobileViewBody extends StatefulWidget {
  const OnBoardingMobileViewBody({super.key});

  @override
  State<OnBoardingMobileViewBody> createState() => _OnBoardingMobileViewBodyState();
}

late PageController controller;

class _OnBoardingMobileViewBodyState extends State<OnBoardingMobileViewBody> {
  double currentPage = 0;
  @override
  void initState() {
    controller = PageController();
    super.initState();
    controller.addListener(() {
      currentPage = controller.page!;
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ManageSkipApperance(currentPage: currentPage),
            SizedBox(
              height: 400,
              child: CustomOnboardingPageView(controller: controller),
            ),
            SizedBox(height: 8),
            DotsIndicator(
              dotsCount: 3,
              position: currentPage,
              decorator: DotsDecorator(
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            ManageButtonsApperance(
              cureentIndex: currentPage.round(),
              pageController: controller,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
