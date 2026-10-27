import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/frequency_and_does_times_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/ongoing_medication_widget.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/selected_days_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_date_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AddMedicineSection(
      title: S.of(context).schedule,
      icon: Icons.calendar_month_outlined,
      children:  [
        const FrequencyAndDoesTimesSection(),
        const SizedBox(height: 20),
        const SelectedDaysSection(),
        const SizedBox(height: 20),
        CustomDateWidget(title: S.of(context).startDate ,),
        const SizedBox(height: 20),
        const OngoingMedicationWidget()
      ],
    );
  }
}
