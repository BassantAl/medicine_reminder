import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/core/di/service_locator.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/manager/delete_medicine_cubit/delete_medicine_cubit.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/delete_medicine_button.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/edit_medicine_button.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/medicine_details_information_section.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/medicine_details_scedule_section.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class MedicineDetailsBody extends StatelessWidget {
  const MedicineDetailsBody({super.key, required this.medicine});

  final HomeMedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DeleteMedicineCubit>()),
      ],

      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MedicineDetailsInformationSection(
              localization: localization,
              medicine: medicine,
            ),
            const SizedBox(height: 20),
            MedicineDetailsScheduleSection(
              localization: localization,
              medicine: medicine,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  8.0),
              child: EditMedicineButton(homeMedicineModel: medicine),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  8.0),
              child: DeleteMedicineButton(medicineId: medicine.medicine.id!),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
