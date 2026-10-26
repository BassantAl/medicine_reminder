import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_drop_down_button_form_feild.dart';
import 'package:medicine_reminder/generated/l10n.dart';

enum MedicationFrequency { onceDaily, twiceDaily, threeTimesDaily, custom }

extension MedicationFrequencyExtension on MedicationFrequency {
  String getLocal({required BuildContext context}) {
    final localization = S.of(context);
    switch (this) {
      case MedicationFrequency.onceDaily:
        return localization.onceDaily;
      case MedicationFrequency.twiceDaily:
        return localization.twiceDaily;
      case MedicationFrequency.threeTimesDaily:
        return localization.threeTimesDaily;
      case MedicationFrequency.custom:
        return localization.custom;
    }
  }
}

class FrequencyWidget extends StatelessWidget {
  const FrequencyWidget({super.key, this.onChanged});

  final ValueChanged<MedicationFrequency?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).frequency),
        const SizedBox(height: 5),
        CustomDropDownButtonFormFeild(
          initialValue: MedicationFrequency.onceDaily,
          items: MedicationFrequency.values.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.getLocal(context: context)),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
