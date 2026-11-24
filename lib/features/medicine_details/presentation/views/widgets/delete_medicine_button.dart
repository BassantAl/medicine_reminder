import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/core/theme/medicine_status_colors.dart';
import 'package:medicine_reminder/core/widgets/custom_button.dart';
import 'package:medicine_reminder/features/home/presentation/manager/get_all_medicines_cubit/get_all_medicines_cubit.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/manager/delete_medicine_cubit/delete_medicine_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class DeleteMedicineButton extends StatelessWidget {
  const DeleteMedicineButton({super.key, required this.medicineId});
  final int medicineId;
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return BlocListener<DeleteMedicineCubit, DeleteMedicineState>(
      listener: (context, state) {
        if (state is DeleteMedicineSuccess) {
          context.go(AppRoutes.homeView);
          context.read<GetAllMedicinesCubit>().getAllMedicines();
        }
      },
      child: CustomPrimaryButton(
        showIcon: false,
        color: Theme.of(context).extension<MedicineStatusColors>()!.missed,
        text: localization.DeleteMedicine,
        onPressed: () {
          showDialog(
            context: context,
            builder: (dialogContext) {
              return BlocProvider.value(
                value: context.read<DeleteMedicineCubit>(),

                child: AlertDialog(
                  title: Text(
                    localization.DeleteMedicine,
                    style: AppStyles.bold20(context: context),
                  ),
                  content: Text(
                    localization.deleteMedicineConfirmation,
                    style: AppStyles.regular16(context: context),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                      },
                      child: Text(localization.cancel),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        context.read<DeleteMedicineCubit>().deleteMedicine(
                          medicineId,
                        );
                      },
                      child: Text(localization.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
