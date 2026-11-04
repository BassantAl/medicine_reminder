import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/core/theme/medicine_status_colors.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class CustomListTitleTrailingWidget extends StatelessWidget {
  const CustomListTitleTrailingWidget({super.key,});


  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Container(
      width: 70,
      height: 28,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(
          context,
        ).extension<MedicineStatusColors>()!.taken.withValues(alpha: 0.145),
      ),
      child: Center(
        child: Text(
          localization.taken,
          style: AppStyles.semiBold14(
            context: context,
            color: Theme.of(context).extension<MedicineStatusColors>()!.taken,
          ),
        ),
      ),
    );
  }
}
