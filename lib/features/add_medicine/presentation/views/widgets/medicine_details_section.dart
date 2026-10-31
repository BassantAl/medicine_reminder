import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_dose_amount.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_text_feild.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/food_instruction_drop_down_button_form_feild.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class MedicineDetailsSection extends StatelessWidget {
  const MedicineDetailsSection({super.key});

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
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return localization.pleaseEnterMedicineName;
            }

            return null;
          },
          hintText: localization.enterMedicineName,
          onSaved: (medicineName) {
            context.read<AddMedicineCubit>().updateMedicineName(medicineName!);
          },
        ),
        const SizedBox(height: 20),
        const CustomDoseAmount(),
        const SizedBox(height: 20),
        Text(localization.foodInstructions),
        const SizedBox(height: 5),
        FoodInstructionDropDownButtonFormFeild(),
      ],
    );
  }
}
