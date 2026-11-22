
import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/get_does_time_header.dart';
import 'package:medicine_reminder/core/methods/get_does_time_period.dart';
import 'package:medicine_reminder/core/methods/is_light.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class DoseTimesMedicineDetails extends StatelessWidget {
  const DoseTimesMedicineDetails({
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
          localization.doseTimes,
          style: AppStyles.semiBold16(context: context).copyWith(
            color: isLight(context) ? Colors.black : Colors.white,
          ),
        ),
    
        Wrap(
          children: medicine.schedule!.doseTimes.map((item) {
            final period = getDoseTimePeriod(item);
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getDoseTimeHeader(period: period, context: context),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      item,
                      style: AppStyles.semiBold18(context: context),
                    ),
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
