import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/is_arabic.dart';
import 'package:medicine_reminder/core/methods/is_light.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_active_and_inactive_week_day_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class SelectedDaysMedicineDetails extends StatelessWidget {
  const SelectedDaysMedicineDetails({
    super.key,
    required this.localization,
    required this.selectedDays,
  });

  final S localization;
  final List<WeekDay> selectedDays;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.selectedDays,
          style: AppStyles.semiBold16(
            context: context,
          ).copyWith(color: isLight(context) ? Colors.black : Colors.white),
        ),
        Wrap(
          children: selectedDays.map((day) {
            return Padding(
              padding: isArabic(context)
                  ? const EdgeInsets.only(left: 8, bottom: 8, top: 12)
                  : const EdgeInsets.only(right: 8, bottom: 8, top: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Text(
                  day.getLocal(context),
                  style: AppStyles.bold14(context: context),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
