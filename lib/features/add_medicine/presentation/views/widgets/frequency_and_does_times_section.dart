import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/dose_times_widget.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/frequency_widget.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_remove_and_add_does_times.dart';
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
            context.read<AddMedicineCubit>().updateFrequency(value.name);
            final count = switch (value) {
              MedicationFrequency.onceDaily => 1,
              MedicationFrequency.twiceDaily => 2,
              MedicationFrequency.threeTimesDaily => 3,
              MedicationFrequency.custom => 0,
            };
            context.read<AddMedicineCubit>().resetDoseTimes(count);
          },
        ),
        const SizedBox(height: 20),
        Text(S.of(context).doseTimes),
        const SizedBox(height: 5),
        if (frequencyValue == MedicationFrequency.onceDaily)
          const DoseTimesWidget(index: 0),

        if (frequencyValue == MedicationFrequency.twiceDaily) ...[
          const DoseTimesWidget(index: 0),
          const SizedBox(height: 16),
          const DoseTimesWidget(index: 1),
        ],

        if (frequencyValue == MedicationFrequency.threeTimesDaily) ...[
          const DoseTimesWidget(index: 0),
          const SizedBox(height: 16),
          const DoseTimesWidget(index: 1),
          const SizedBox(height: 16),
          const DoseTimesWidget(index: 2),
        ],

        if (frequencyValue == MedicationFrequency.custom)
          ManageRemoveAndAddDoseTimes(),
      ],
    );
  }
}
