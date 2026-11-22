import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicine_reminder/core/methods/is_light.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({super.key, required this.medicine});
  final HomeMedicineModel medicine;
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.duration,
          style: AppStyles.semiBold16(
            context: context,
          ).copyWith(color: isLight(context) ? Colors.black : Colors.white),
        ),
        const SizedBox(height: 8),

        Row(
          children: [
            Text(
              localization.startDate,
              style: AppStyles.regular16(context: context),
            ),
            const Spacer(),
            Text(
              DateFormat(
                'dd MMM yyyy',
              ).format(DateTime.parse(medicine.schedule!.startDate.toString())),
              style: AppStyles.bold14(context: context),
            ),
          ],
        ),
        const SizedBox(height: 8),

        Row(
          children: [
            Text(
              localization.endDate,
              style: AppStyles.regular16(context: context),
            ),
            const Spacer(),
            Text(
              medicine.schedule!.endDate == null
                  ? localization.ongoing
                  : DateFormat('dd MMM yyyy').format(
                      DateTime.parse(medicine.schedule!.endDate.toString()),
                    ),
              style: AppStyles.bold14(context: context),
            ),
          ],
        ),
      ],
    );
  }
}
