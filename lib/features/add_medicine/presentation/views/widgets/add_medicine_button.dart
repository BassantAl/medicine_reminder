
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/core/widgets/custom_button.dart';

import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/home/presentation/manager/get_all_medicines_cubit/get_all_medicines_cubit.dart';

import 'package:medicine_reminder/generated/l10n.dart';

class AddMedicineButton extends StatelessWidget {
  const AddMedicineButton({
    super.key,
    required this.formkey,
  });

  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMedicineCubit, AddMedicineState>(
      listener: (context, state) {
        if (state is AddMedicineSuccess) {
          context.read<GetAllMedicinesCubit>().getAllMedicines();

          Navigator.pop(context);
        }
      },
      child: CustomPrimaryButton(
        showIcon: false,
        text: S.of(context).addMedicine,
        onPressed: () {
          final form = formkey.currentState!;

          if (!form.validate()) return;

          form.save();

          final cubit = context.read<AddMedicineCubit>();

          if (!cubit.hasAtLeastOneDose()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  S.of(context).pleaseEnterAtLeastOneDose,
                  style: AppStyles.bold18(context: context),
                ),
              ),
            );

            return;
          }

          cubit.addMedicine();
        },
      ),
    );
  }
}
