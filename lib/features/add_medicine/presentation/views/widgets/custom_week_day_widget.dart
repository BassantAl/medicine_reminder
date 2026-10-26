import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';

class CustomWeekDayWidget extends StatelessWidget {
  const CustomWeekDayWidget({super.key, required this.isSelected, required this.title});
  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal:  16,vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.primary, width: 0.5),
        color: isSelected
            ? theme.scaffoldBackgroundColor
            : theme.colorScheme.surface,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,style: AppStyles.regular16(context: context),),
          Visibility(visible: isSelected, child: const SizedBox(width: 4,)),
          Visibility(visible: isSelected, child: Icon(Icons.check,size: 18,))
        ],
      ),
    );
  }
}
