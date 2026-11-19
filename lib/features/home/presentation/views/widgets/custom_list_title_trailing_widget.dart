import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/enums/does_status_enum.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';

class CustomListTitleTrailingWidget extends StatelessWidget {
  const CustomListTitleTrailingWidget({super.key, required this.status});
  final DoesStatusEnum status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 28,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: status.color(context: context).withValues(alpha: 0.145),
      ),
      child: Center(
        child: Text(
          status.localizedName(context: context),
          style: AppStyles.semiBold14(
            context: context,
            color: status.color(context: context)
          ),
        ),
      ),
    );
  }
}
