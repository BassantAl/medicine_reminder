import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/onboarding/presentation/views/widgets/custom_onboarding_page_view.dart';
import 'package:medicine_reminder/features/onboarding/presentation/views/widgets/manage_buttons_apperance.dart';
import 'package:medicine_reminder/features/onboarding/presentation/views/widgets/manage_skip_apperance.dart';

class OnBoardingTabletViewBody extends StatefulWidget {
  const OnBoardingTabletViewBody({super.key});

  @override
  State<OnBoardingTabletViewBody> createState() =>
      _OnBoardingTabletViewBodyState();
}

class _OnBoardingTabletViewBodyState extends State<OnBoardingTabletViewBody> {
  late final PageController controller;

  double currentPage = 0;

  @override
  void initState() {
    super.initState();

    controller = PageController();

    controller.addListener(() {
      if (controller.page != null) {
        setState(() {
          currentPage = controller.page!;
        });
      }
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
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48,vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ManageSkipApperance(currentPage: currentPage),
                SizedBox(
                  height: 500,
                  child: CustomOnboardingPageView(controller: controller),
                ),
                const SizedBox(height: 12),
                DotsIndicator(
                  dotsCount: 3,
                  position: currentPage,
                  decorator: DotsDecorator(
                    activeColor: Theme.of(context).colorScheme.primary,
                    size: const Size.square(10),
                    activeSize: const Size(24, 10),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 550),
                    child: ManageButtonsApperance(
                      cureentIndex: currentPage.round(),
                      pageController: controller,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
