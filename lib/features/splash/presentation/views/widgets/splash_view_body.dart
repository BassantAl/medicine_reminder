import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder/core/constants/assets.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/core/theme/medicine_status_colors.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.resourceImagesAppIcon),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).appName,
                  style: AppStyles.extraBold30(context: context),
                ),
                TextSpan(
                  text: S.of(context).appName1,
                  style: AppStyles.extraBold30(
                    context: context,
                    color: Theme.of(
                      context,
                    ).extension<MedicineStatusColors>()!.taken,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(S.of(context).splashTitle),
        ),
      ],
    );
  }
}
