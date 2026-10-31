import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/daily_dose_item.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_active_and_inactive_week_day_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class DailyDoseFields extends StatelessWidget {
  const DailyDoseFields({super.key, required this.sameDoseEveryDay});

  final bool sameDoseEveryDay;

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final colors = Theme.of(context).colorScheme;
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      child: sameDoseEveryDay
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localization.doseForEachDay,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    localization.setDoseForEachDay,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),

                  ...WeekDay.values.map((day) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: AppDecoration.boxDecoration(
                          context: context,
                        ),
                        child: DailyDoseItem(day: day ,sameDoseEveryDay: sameDoseEveryDay,),
                      ),
                    );
                  }),
                ],
              ),
            ),
    );
  }
}
