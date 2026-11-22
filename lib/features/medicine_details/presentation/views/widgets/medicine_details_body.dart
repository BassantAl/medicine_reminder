import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/medicine_details_information_section.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/medicine_details_scedule_section.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class MedicineDetailsBody extends StatelessWidget {
  const MedicineDetailsBody({
    super.key,
    required this.medicine,
  });

  final HomeMedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return Padding(
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
        ],
      ),
    );
  }
}