import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/get_current_day_index.dart';
import 'package:medicine_reminder/core/widgets/custom_dose_amount_text_feild.dart';
import 'package:medicine_reminder/core/widgets/custom_medicine_name.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_section.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/views/widgets/custom_dose_amount_for_edit_medicine.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class EditMedicineDetailsSection extends StatelessWidget {
  const EditMedicineDetailsSection({
    super.key,
    required this.homeMedicineModel,
  });
  final HomeMedicineModel homeMedicineModel;
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return AddMedicineSection(
      title: localization.medicineInformation,
      icon: Icons.medication_outlined,
      children: [
        Text(localization.medicineName),
        const SizedBox(height: 5),
        CustomMedicineName(hintText: homeMedicineModel.medicine.name),
  CustomDoseAmountForEditMedicine(homeMedicineModel: homeMedicineModel)
      ],
    );
  }


}
