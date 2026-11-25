import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/dose_times_widget.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/frequency_widget.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_remove_and_add_does_times.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class FrequencyAndDoesTimesSection extends StatefulWidget {
  const FrequencyAndDoesTimesSection({super.key, required this.isEdit});

  final bool isEdit;

  @override
  State<FrequencyAndDoesTimesSection> createState() =>
      _FrequencyAndDoesTimesSectionState();
}

class _FrequencyAndDoesTimesSectionState
    extends State<FrequencyAndDoesTimesSection> {
  late MedicationFrequency frequencyValue;

  @override
  void initState() {
    super.initState();

    if (widget.isEdit) {
      final frequency = context.read<UpdateMedicineCubit>().frequency;

      frequencyValue = MedicationFrequency.values.firstWhere(
        (value) => value.name == frequency,
      );
    } else {
      frequencyValue = MedicationFrequency.onceDaily;
    }
  }

  // Get the saved time from UpdateMedicineCubit.
String? _getInitialTime(int index) {
  if (!widget.isEdit) return null;

  final doseTimes = context.read<UpdateMedicineCubit>().doseTimes;

  if (index >= doseTimes.length) return null;

  final time = doseTimes[index];

  return time.isEmpty ? null : time;
}

  void _updateFrequency(MedicationFrequency value) {
    final count = switch (value) {
      MedicationFrequency.onceDaily => 1,
      MedicationFrequency.twiceDaily => 2,
      MedicationFrequency.threeTimesDaily => 3,
      MedicationFrequency.custom => 0,
    };

    if (widget.isEdit) {
      final cubit = context.read<UpdateMedicineCubit>();

      cubit.updateFrequency(value.name);
      cubit.resetDoseTimes(count);
    } else {
      final cubit = context.read<AddMedicineCubit>();

      cubit.updateFrequency(value.name);
      cubit.resetDoseTimes(count);
    }
  }

  Widget _buildDoseTime(int index) {
    return DoseTimesWidget(
      key: ValueKey('dose_time_$index'),
      index: index,
      isEdit: widget.isEdit,
      initialTime: _getInitialTime(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FrequencyWidget(
          initialValue: frequencyValue,
          onChanged: (value) {
            if (value == null) return;

            setState(() {
              frequencyValue = value;
            });

            _updateFrequency(value);
          },
        ),

        const SizedBox(height: 20),
        Text(S.of(context).doseTimes),
        const SizedBox(height: 5),

        if (frequencyValue == MedicationFrequency.onceDaily) _buildDoseTime(0),
        if (frequencyValue == MedicationFrequency.twiceDaily) ...[
          _buildDoseTime(0),
          const SizedBox(height: 16),
          _buildDoseTime(1),
        ],
        if (frequencyValue == MedicationFrequency.threeTimesDaily) ...[
          _buildDoseTime(0),
          const SizedBox(height: 16),
          _buildDoseTime(1),
          const SizedBox(height: 16),
          _buildDoseTime(2),
        ],
        if (frequencyValue == MedicationFrequency.custom)
          ManageRemoveAndAddDoseTimes(isEdit: widget.isEdit),
      ],
    );
  }
}
