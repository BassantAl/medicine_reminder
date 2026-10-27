import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';

class CustomRadioListTitle extends StatelessWidget {
  const CustomRadioListTitle({
    super.key,
    required this.title,
    required this.value,
    required this.isSelected,
  });
  final String title;
  final String value;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: AppDecoration.boxDecoration(
        context: context,
        color: isSelected
            ? theme.scaffoldBackgroundColor
            : theme.colorScheme.surface,
      ),
      child: RadioListTile(
        activeColor: theme.colorScheme.secondary,
        title: Text(title, style: AppStyles.regular16(context: context)),
        value: value,
      ),
    );
  }
}
