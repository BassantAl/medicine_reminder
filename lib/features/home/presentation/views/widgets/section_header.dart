import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Row(
      children: [
        Icon(Icons.watch_later_outlined, size: 19),
        const SizedBox(width: 5),
        Text(localization.schedule, style: AppStyles.bold24(context: context)),
      ],
    );
  }
}
