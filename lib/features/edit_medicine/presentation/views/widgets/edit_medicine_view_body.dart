
import 'package:flutter/material.dart';

import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/additional_notes_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/reminders_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/schedule_section.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/views/widgets/edit_medicine_button.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/views/widgets/edit_medicine_details_section.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';

class EditMedicineViewBody extends StatefulWidget {
  const EditMedicineViewBody({
    super.key,
    required this.homeMedicineModel,
  });

  final HomeMedicineModel homeMedicineModel;

  @override
  State<EditMedicineViewBody> createState() =>
      _EditMedicineViewBodyState();
}

class _EditMedicineViewBodyState extends State<EditMedicineViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            EditMedicineDetailsSection(
              homeMedicineModel: widget.homeMedicineModel,
            ),

            const SizedBox(height: 8),

            ScheduleSection(
              homeMedicineModel: widget.homeMedicineModel,
              isEdit: true,
            ),
            const SizedBox(height: 8),
            const RemindersSection(isEdit: true),
            const SizedBox(height: 8),
            const AdditionalNotesSection(isEdit: true),
            const SizedBox(height: 8),
            EditMedicineButton(
              formKey: formKey,
              medicineId: widget.homeMedicineModel.medicine.id!,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}




