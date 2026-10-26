import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_drop_down_button_form_feild.dart';
import 'package:medicine_reminder/generated/l10n.dart';

enum FoodInstruction {
  beforeFood,
  withFood,
  afterFood,
  emptyStomach,
  noRestriction,
}

extension FoodInstructionExtension on FoodInstruction {
  String getLabel({required BuildContext context}) {
    final localization = S.of(context);

    switch (this) {
      case FoodInstruction.beforeFood:
        return localization.beforeFood;
      case FoodInstruction.afterFood:
        return localization.afterFood;
      case FoodInstruction.withFood:
        return localization.withFood;
      case FoodInstruction.noRestriction:
        return localization.noInstruction;
      case FoodInstruction.emptyStomach:
        return localization.emptyStomach;
    }
  }
}

class FoodInstructionDropDownButtonFormFeild extends StatefulWidget {
  const FoodInstructionDropDownButtonFormFeild({super.key});

  @override
  State<FoodInstructionDropDownButtonFormFeild> createState() =>
      _FoodInstructionDropDownButtonFormFeildState();
}

class _FoodInstructionDropDownButtonFormFeildState
    extends State<FoodInstructionDropDownButtonFormFeild> {
  FoodInstruction? selectedInstruction;

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButtonFormFeild(
      initialValue: selectedInstruction,
      items: FoodInstruction.values.map((instruction) {
        return DropdownMenuItem(
          value: instruction,
          child: Text(instruction.getLabel(context: context)),
        );
      }).toList(),
      onChanged: (value) {
        selectedInstruction = value;
      },
    );
  }
}
