import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/extensions/string_extension.dart';
import 'package:medicine_reminder/core/methods/is_light.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class MedicineDetailsInformationSection extends StatelessWidget {
  const MedicineDetailsInformationSection({
    super.key,
    required this.localization,
    required this.medicine,
  });

  final S localization;
  final HomeMedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppDecoration.boxDecoration(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.medicineInformation,
            style: AppStyles.bold20(
              context: context,
            ).copyWith(color: isLight(context) ? Colors.black : Colors.white),
          ),
          ListTile(
            title: Text(
              medicine.medicine.name.trim().capitalize,
              style: AppStyles.semiBold18(context: context),
            ),
            leading: const Icon(Icons.medication_outlined),
            subtitle: Text(
              (medicine.medicine.foodInstruction ?? '')
                  .split('.')
                  .last
                  .trim()
                  .capitalize,
              style: AppStyles.bold14(context: context),
            ),
          ),
        ],
      ),
    );
  }
}
