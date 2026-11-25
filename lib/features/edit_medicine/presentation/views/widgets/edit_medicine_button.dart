import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';

import 'package:medicine_reminder/core/widgets/custom_button.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';
import 'package:medicine_reminder/features/home/presentation/manager/get_all_medicines_cubit/get_all_medicines_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class EditMedicineButton extends StatelessWidget {
  const EditMedicineButton({
    super.key,
    required this.formKey,
    required this.medicineId,
  });

  final GlobalKey<FormState> formKey;
  final int medicineId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateMedicineCubit, UpdateMedicineState>(
      listener: (context, state) {
        if (state is UpdateMedicineSuccess) {
          context.read<GetAllMedicinesCubit>().getAllMedicines();

              context.go(AppRoutes.homeView);
           
        }

        if (state is UpdateMedicineFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.failure.errorMessage)));
        }
      },
      child: BlocBuilder<UpdateMedicineCubit, UpdateMedicineState>(
        builder: (context, state) {
          final isLoading = state is UpdateMedicineLoading;

          return CustomPrimaryButton(
            showIcon: false,
            text: isLoading ? S.of(context).loading : S.of(context).saveChanges,
            onPressed: () {
              if (isLoading) return;

              final form = formKey.currentState;

              if (form == null || !form.validate()) return;

              form.save();

              final cubit = context.read<UpdateMedicineCubit>();

              if (!cubit.hasChanges()) {
                context.go(AppRoutes.homeView);
                return;
              }

              cubit.updateMedicine(medicineId: medicineId);
            },
          );
        },
      ),
    );
  }
}
