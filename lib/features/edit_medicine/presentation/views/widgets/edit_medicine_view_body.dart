
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';

import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';

import 'package:medicine_reminder/features/edit_medicine/presentation/views/widgets/edit_medicine_details_section.dart';

import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class EditMedicineViewBody extends StatefulWidget {
  const EditMedicineViewBody({
    super.key,
    required this.homeMedicineModel,
  });

  final HomeMedicineModel homeMedicineModel;

  @override
  State<EditMedicineViewBody> createState() =>
      _EditMedicineViewBodyState();
}

class _EditMedicineViewBodyState extends State<EditMedicineViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void saveMedicine() {
    if (!formKey.currentState!.validate()) return;

    formKey.currentState!.save();

    context.read<UpdateMedicineCubit>().updateMedicine(
      medicineId: widget.homeMedicineModel.medicine.id!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return BlocListener<UpdateMedicineCubit, UpdateMedicineState>(
      listener: (context, state) {
        if (state is UpdateMedicineSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Medicine updated successfully'),
            ),
          );

          context.go(AppRoutes.homeView);
        }

        if (state is UpdateMedicineFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.errorMessage),
            ),
          );
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.medicineDetails,
                style: AppStyles.bold24(context: context),
              ),
              const SizedBox(height: 5),
              Text(
                localization.enterMedicineInformationAndSchedule,
                style: AppStyles.regular14(context: context),
              ),
              const SizedBox(height: 24),

              EditMedicineDetailsSection(
                homeMedicineModel: widget.homeMedicineModel,
              ),

              const SizedBox(height: 24),

              BlocBuilder<UpdateMedicineCubit, UpdateMedicineState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state is UpdateMedicineLoading
                          ? null
                          : saveMedicine,
                      child: state is UpdateMedicineLoading
                          ? const CircularProgressIndicator()
                          : const Text('Save Changes'),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

