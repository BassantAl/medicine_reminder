import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/onboarding/data/models/onbarding_model.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem({super.key, required this.onbardingModel});
  final OnbardingModel onbardingModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(onbardingModel.image),
          const SizedBox(height: 30),
          Text(onbardingModel.title,style: AppStyles.bold24(context: context),textAlign: TextAlign.center,),
          const SizedBox(height: 8,),
          Text(onbardingModel.subtitle,style: AppStyles.regular16(context: context),textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
