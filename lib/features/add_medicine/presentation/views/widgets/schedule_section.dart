import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/frequency_and_does_times_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/ongoing_medication_widget.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/selected_days_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_date_widget.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({
    super.key,
     this.homeMedicineModel,
    required this.isEdit,
  });

  final HomeMedicineModel? homeMedicineModel;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return AddMedicineSection(
      title: S.of(context).schedule,
      icon: Icons.calendar_month_outlined,
      children: [
         FrequencyAndDoesTimesSection(isEdit:isEdit ,),
        const SizedBox(height: 20),
         SelectedDaysSection(isEdit:isEdit),
        const SizedBox(height: 20),
        CustomDateWidget(title: S.of(context).startDate, isStartDate: true ,isEdit:isEdit),
        const SizedBox(height: 20),
         OngoingMedicationWidget(isEdit: isEdit,),
      ],
    );
  }
}
