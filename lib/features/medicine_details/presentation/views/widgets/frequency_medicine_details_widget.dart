import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/is_light.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/frequency_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class FrequencyMedicineDetailsWidget extends StatelessWidget {
  const FrequencyMedicineDetailsWidget({
    super.key,
    required this.localization,
    required this.schedule,
  });

  final S localization;
  final DoesScheduleModel? schedule;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          localization.frequency,
          style: AppStyles.semiBold16(
            context: context,
          ).copyWith(color: isLight(context) ? Colors.black : Colors.white),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: Text(
            convertStringToMedicationFrequency().getLocal(context: context),

            style: AppStyles.bold14(context: context),
          ),
        ),
      ],
    );
  }

  MedicationFrequency convertStringToMedicationFrequency() {
    final value = MedicationFrequency.values
        .where((item) => item.name == schedule!.frequency)
        .first;
    return value;
  }
}
