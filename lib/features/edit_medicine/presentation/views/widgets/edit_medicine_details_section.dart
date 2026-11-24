import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_dose_amount.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_text_feild.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/food_instruction_drop_down_button_form_feild.dart';

import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';

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

        CustomTextFeild(
          initialValue: homeMedicineModel.medicine.name,
          onSaved: (value) {
            context.read<UpdateMedicineCubit>().updateMedicineName(
              value?.trim() ?? '',
            );
          },
        ),

        const SizedBox(height: 20),

        CustomDoseAmount(isEdit: true, homeMedicineModel: homeMedicineModel),

        const SizedBox(height: 20),

        Text(localization.foodInstructions),
        const SizedBox(height: 5),

        FoodInstructionDropDownButtonFormFeild(
          isEdit: true,
          initialInstruction: homeMedicineModel.medicine.foodInstruction,
        ),
      ],
    );
  }
}
