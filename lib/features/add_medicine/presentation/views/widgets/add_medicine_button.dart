import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/core/widgets/custom_button.dart';

import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/home/presentation/manager/get_all_medicines_cubit/get_all_medicines_cubit.dart';

import 'package:medicine_reminder/generated/l10n.dart';

class AddMedicineButton extends StatelessWidget {
  const AddMedicineButton({super.key, required this.formkey});

  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMedicineCubit, AddMedicineState>(
      listener: (context, state) {
        if (state is AddMedicineSuccess) {
          context.read<GetAllMedicinesCubit>().getAllMedicines();

          context.pop();
        }
      },
      child: BlocBuilder<AddMedicineCubit, AddMedicineState>(
        builder: (context, state) {
          final isLoading = state is AddMedicineLoading;

          return CustomPrimaryButton(
            showIcon: false,
            text: isLoading ? S.of(context).loading : S.of(context).addMedicine,
            onPressed: () {
              if (isLoading) return;

              final form = formkey.currentState;

              if (form == null || !form.validate()) return;

              form.save();

              final cubit = context.read<AddMedicineCubit>();
              if (cubit.selectedDays.isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        S.of(context).pleaseSelectAtLeastOneDay,
        style: AppStyles.bold18(context: context),
      ),
    ),
  );
  return;
}

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

              if (!cubit.validateDailyDoses()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      S.of(context).pleaseSetDoseForAllSelectedDays,
                      style: AppStyles.bold18(context: context),
                    ),
                  ),
                );

                return;
              }

              cubit.addMedicine();
            },
          );
        },
      ),
    );
  }
}
