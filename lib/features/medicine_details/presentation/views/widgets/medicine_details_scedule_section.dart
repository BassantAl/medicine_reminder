import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/get_day_name.dart';
import 'package:medicine_reminder/core/methods/is_arabic.dart';
import 'package:medicine_reminder/core/methods/is_light.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_active_and_inactive_week_day_widget.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/generated/l10n.dart';


class MedicineDetailsScheduleSection extends StatelessWidget {
  const MedicineDetailsScheduleSection({
    super.key,
    required this.localization,
    required this.medicine,
  });

  final S localization;
  final HomeMedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    final schedule = medicine.schedule;

    if (schedule == null) {
      return const SizedBox.shrink();
    }

    final selectedDays = schedule.selectedDays
        .map((day) => getDayaName(day: day))
        .toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppDecoration.boxDecoration(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.scheduleInformation,
            style: AppStyles.bold20(
              context: context,
            ).copyWith(color: isLight(context) ? Colors.black : Colors.white),
          ),
          const SizedBox(height: 16),

          // Frequency
          Row(
            children: [
              Text(
                localization.frequency,
                style: AppStyles.semiBold16(context: context).copyWith(
                  color: isLight(context) ? Colors.black : Colors.white,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Text(
                  schedule.frequency.trim(),
                  style: AppStyles.bold14(context: context),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Selected Days
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.selectedDays,
                style: AppStyles.semiBold16(context: context).copyWith(
                  color: isLight(context) ? Colors.black : Colors.white,
                ),
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
          ),

          const SizedBox(height: 16),

          // Daily Doses
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.dailyDoses,
                style: AppStyles.semiBold16(context: context).copyWith(
                  color: isLight(context) ? Colors.black : Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: medicine.dailyDoses.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Text(
                          getDayaName(day: item.dayOfWeek).getLocal(context),
                          style: AppStyles.semiBold16(context: context).copyWith(),
                        ),
                        const Spacer(),
                        Text(item.doseAmount.toString(),style: AppStyles.bold14(context: context),),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
