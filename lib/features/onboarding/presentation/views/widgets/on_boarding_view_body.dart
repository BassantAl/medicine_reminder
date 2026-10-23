import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/core/widgets/custom_button.dart';
import 'package:medicine_reminder/features/onboarding/presentation/views/widgets/custom_onboarding_page_view.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

late PageController controller;

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
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
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                S.of(context).skip,
                style: AppStyles.bold14(context: context),
              ),
            ),
            Expanded(child: CustomOnboardingPageView(controller: controller)),
            DotsIndicator(
              dotsCount: 3,
              position: currentPage,
              decorator: DotsDecorator(
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 40),
            CustomPrimaryButton(text: 'Next', onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
