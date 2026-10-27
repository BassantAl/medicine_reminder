import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_text_feild.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_active_and_inactive_week_day_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class DailyDoseItem extends StatelessWidget {
  const DailyDoseItem({super.key, required this.day});

  final WeekDay day;

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        const SizedBox(width: 8),
        Icon(Icons.event_available_outlined, size: 20, color: colors.primary),
        const SizedBox(width: 12),

        Expanded(
          child: Text(
            day.getLocal(context),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),

        SizedBox(
          width: 110,
          child: CustomTextFeild(hintText: localization.Dose),
        ),
      ],
    );
  }
}
