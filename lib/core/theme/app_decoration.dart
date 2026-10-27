import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';

abstract class AppDecoration {
  static InputDecoration inputDecoration({
    String? hintText,
    required BuildContext context,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppStyles.regular16(context: context),
      filled: true,
      fillColor: Theme.of(context).scaffoldBackgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).dividerColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).dividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 1.5,
        ),
      ),
    );
  }

  static BoxDecoration boxDecoration({
    required BuildContext context,
    Color? color,
  }) {
    return BoxDecoration(
      color: color ?? Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
        width: 0.5,
      ),
    );
  }
}
