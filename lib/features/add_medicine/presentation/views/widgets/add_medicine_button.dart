import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/core/widgets/custom_button.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class AddMedicineButton extends StatelessWidget {
  const AddMedicineButton({super.key, required this.formkey});
  final GlobalKey<FormState> formkey;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMedicineCubit, AddMedicineState>(
      listener: (context, state) {
        if (state is AddMedicineSuccess) {
          Navigator.pop(context);
        }
      },
      child: CustomPrimaryButton(
        showIcon: false,
        text: S.of(context).addMedicine,
        onPressed: () {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            context.read<AddMedicineCubit>().addMedicine();
          }
        },
      ),
    );
  }
}
