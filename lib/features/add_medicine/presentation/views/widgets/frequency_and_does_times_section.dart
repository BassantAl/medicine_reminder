import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/dose_times_widget.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/frequency_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class FrequencyAndDoesTimesSection extends StatefulWidget {
  const FrequencyAndDoesTimesSection({super.key});

  @override
  State<FrequencyAndDoesTimesSection> createState() =>
      _FrequencyAndDoesTimesSectionState();
}

class _FrequencyAndDoesTimesSectionState
    extends State<FrequencyAndDoesTimesSection> {
  MedicationFrequency frequencyValue = MedicationFrequency.onceDaily;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FrequencyWidget(
          onChanged: (value) {
            frequencyValue = value!;
            setState(() {});
          },
        ),
        const SizedBox(height: 20),
        Text(S.of(context).doseTimes),
        const SizedBox(height: 5),
        if (frequencyValue == MedicationFrequency.onceDaily)
          const DoseTimesWidget(),

        if (frequencyValue == MedicationFrequency.twiceDaily) ...[
          const DoseTimesWidget(),
          const SizedBox(height: 16),
          const DoseTimesWidget(),
        ],
        if (frequencyValue == MedicationFrequency.threeTimesDaily) ...[
          const DoseTimesWidget(),
          const SizedBox(height: 16),
          const DoseTimesWidget(),
          const SizedBox(height: 16),
          const DoseTimesWidget(),
        ],
      ],
    );
  }
}
