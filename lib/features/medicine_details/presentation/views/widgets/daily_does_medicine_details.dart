
import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/get_day_name.dart';
import 'package:medicine_reminder/core/methods/is_light.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_active_and_inactive_week_day_widget.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class DailyDosesMedicineDetails extends StatelessWidget {
  const DailyDosesMedicineDetails({
    super.key,
    required this.localization,
    required this.medicine,
  });

  final S localization;
  final HomeMedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.dailyDoses,
          style: AppStyles.semiBold16(context: context).copyWith(
            color: isLight(context) ? Colors.black : Colors.white,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: medicine.dailyDoses.map((item) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text(
                    getDayaName(day: item.dayOfWeek).getLocal(context),
                    style: AppStyles.semiBold16(
                      context: context,
                    ).copyWith(),
                  ),
                  const Spacer(),
                  Text(
                    item.doseAmount.toString(),
                    style: AppStyles.bold14(context: context),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
