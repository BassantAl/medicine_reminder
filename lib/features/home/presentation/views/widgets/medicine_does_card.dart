import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/enums/does_status_enum.dart';
import 'package:medicine_reminder/core/methods/get_dose_status.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/custom_does_card_buttons.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/custom_medicine_does_card_list_title.dart';

class MedicineDoseCard extends StatelessWidget {
  const MedicineDoseCard({
    super.key,
    required this.medicine,
    required this.doseTime,
    required this.dailyDose,
  });

  final HomeMedicineModel medicine;
  final String doseTime;
  final DailyDoesModel dailyDose;

  @override
  Widget build(BuildContext context) {
    final doseStatus = getDoseStatus(
      doseHistories: medicine.doseHistories,
      dailyDoseId: dailyDose.id!,
      date: DateTime.now(),
      doseTime: doseTime,
    );

    final shouldHideButtons =
        doseStatus == DoesStatusEnum.taken ||
        doseStatus == DoesStatusEnum.skipped ||
        doseStatus == DoesStatusEnum.missed ||
        doseStatus == DoesStatusEnum.upcoming;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        children: [
          CustomMedicineDoesCardListTitle(
            medicine: medicine,
            doseTime: doseTime,
            doseStatus: doseStatus,
          ),

          if (!shouldHideButtons) ...[
            CustomDoesCardButtons(doseTime: doseTime, dailyDose: dailyDose),
          ],
        ],
      ),
    );
  }
}
