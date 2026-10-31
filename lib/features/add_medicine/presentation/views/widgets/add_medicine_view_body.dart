import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_button.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/additional_notes_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/medicine_details_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/reminders_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/schedule_section.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class AddMedicineViewBody extends StatelessWidget {
  const AddMedicineViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
      final formKey = GlobalKey<FormState>();
    debugPrint('Direction: ${Directionality.of(context)}');
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.medicineDetails,
                style: AppStyles.bold24(context: context),
              ),
              const SizedBox(height: 5),
              Text(
                localization.enterMedicineInformationAndSchedule,
                style: AppStyles.regular14(context: context),
              ),
              const SizedBox(height: 24),
              const MedicineDetailsSection(),
              const SizedBox(height: 8),
              const ScheduleSection(),
              const SizedBox(height: 8),
              const RemindersSection(),
              const SizedBox(height: 8),
              const AdditionalNotesSection(),
              const SizedBox(height: 8),
               AddMedicineButton(formkey: formKey,),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
