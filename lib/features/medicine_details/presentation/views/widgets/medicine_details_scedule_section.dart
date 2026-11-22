import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/get_day_name.dart';
import 'package:medicine_reminder/core/methods/is_light.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/daily_does_medicine_details.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/dose_times_medicine_details.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/duration_widget.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/frequency_medicine_details_widget.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/selected_days_medicine_details.dart';
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
          FrequencyMedicineDetailsWidget(
            localization: localization,
            schedule: schedule,
          ),
          const SizedBox(height: 16),
          SelectedDaysMedicineDetails(localization: localization, selectedDays: selectedDays),
          const SizedBox(height: 16),
          DailyDosesMedicineDetails(localization: localization, medicine: medicine),
          const SizedBox(height: 16),
          DoseTimesMedicineDetails(localization: localization, medicine: medicine),
          const SizedBox(height: 16),
          DurationWidget(medicine: medicine),
        ],
      ),
    );
  }
}
