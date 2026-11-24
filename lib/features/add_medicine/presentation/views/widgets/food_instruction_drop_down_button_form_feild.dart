import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_drop_down_button_form_feild.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';

enum FoodInstruction {
  beforeFood,
  withFood,
  afterFood,
  emptyStomach,
  noInstruction,
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
      case FoodInstruction.noInstruction:
        return localization.noInstruction;
      case FoodInstruction.emptyStomach:
        return localization.emptyStomach;
    }
  }
}

class FoodInstructionDropDownButtonFormFeild extends StatefulWidget {
  const FoodInstructionDropDownButtonFormFeild({
    super.key,
    this.isEdit = false,
    this.initialInstruction,
  });

  final bool isEdit;
  final String? initialInstruction;

  @override
  State<FoodInstructionDropDownButtonFormFeild> createState() =>
      _FoodInstructionDropDownButtonFormFeildState();
}

class _FoodInstructionDropDownButtonFormFeildState
    extends State<FoodInstructionDropDownButtonFormFeild> {
  late FoodInstruction selectedInstruction;

  @override
  void initState() {
    super.initState();

    selectedInstruction = FoodInstruction.values.firstWhere(
      (instruction) => instruction.name == widget.initialInstruction,
      orElse: () => FoodInstruction.noInstruction,
    );
  }

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
        if (value == null) return;

        setState(() {
          selectedInstruction = value;
        });

        if (widget.isEdit) {
          context.read<UpdateMedicineCubit>().updateFoodInstruction(
                value.name,
              );
        } else {
          context.read<AddMedicineCubit>().updateFoodInstruction(
                value.name,
              );
        }
      },
    );
  }
}
