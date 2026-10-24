import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/constants/assets.dart';
import 'package:medicine_reminder/features/onboarding/data/models/onbarding_model.dart';
import 'package:medicine_reminder/features/onboarding/presentation/views/widgets/onboarding_page_view_item.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class CustomOnboardingPageView extends StatefulWidget {
  const CustomOnboardingPageView({super.key, required this.controller});

  final PageController controller;

  @override
  State<CustomOnboardingPageView> createState() =>
      _CustomOnboardingPageViewState();
}

class _CustomOnboardingPageViewState extends State<CustomOnboardingPageView> {
  late List<OnbardingModel> onboardingPageViewItemsContent;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    onboardingPageViewItemsContent = [
      OnbardingModel(
        image: Assets.resourceImagesOnboardingImage1,
        title: S.of(context).onboardingPage1Title,
        subtitle: S.of(context).onboardingPage1Subtitle,
      ),
      OnbardingModel(
        image: Assets.resourceImagesOnboardingImage2,
        title: S.of(context).onboardingPage2Title,
        subtitle: S.of(context).onboardingPage2Subtitle,
      ),
      OnbardingModel(
        image: Assets.resourceImagesOnboardingImage3,
        title: S.of(context).onboardingPage3Title,
        subtitle: S.of(context).onboardingPage3Subtitle,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.controller,
      itemCount: onboardingPageViewItemsContent.length,
      itemBuilder: (context, index) {
        return OnboardingPageViewItem(
          onbardingModel: onboardingPageViewItemsContent[index],
        );
      },
    );
  }
}
