import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/frequency_and_does_times_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/selected_days_section.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AddMedicineSection(
      title: S.of(context).schedule,
      icon: Icons.calendar_month_outlined,
      children: const[
       FrequencyAndDoesTimesSection(),
        SizedBox(height: 20),
       SelectedDaysSection()
      ],
    );
  }
}
