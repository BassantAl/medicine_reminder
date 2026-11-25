import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';

class DoseTimesWidget extends StatefulWidget {
  const DoseTimesWidget({
    super.key,
    required this.index,
    required this.isEdit,
    this.initialTime,
  });

  final bool isEdit;
  final int index;
  final String? initialTime;

  @override
  State<DoseTimesWidget> createState() => _DoseTimesWidgetState();
}

class _DoseTimesWidgetState extends State<DoseTimesWidget> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();

    selectedTime = _parseInitialTime(widget.initialTime);

    if (!widget.isEdit) {
      _updateCubit(selectedTime);
    }
  }

  TimeOfDay _parseInitialTime(String? value) {
    if (value == null || value.isEmpty) {
      return TimeOfDay.now();
    }

    final parts = value.split(':');

    if (parts.length != 2) {
      return TimeOfDay.now();
    }

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    if (hour == null ||
        minute == null ||
        hour < 0 ||
        hour > 23 ||
        minute < 0 ||
        minute > 59) {
      return TimeOfDay.now();
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}';
  }

  void _updateCubit(TimeOfDay time) {
    context.read<AddMedicineCubit>().updateDoseTime(
      widget.index,
      _formatTime(time),
    );
  }

  void _updateTime(TimeOfDay time) {
    context.read<UpdateMedicineCubit>().updateDoseTime(
      widget.index,
      _formatTime(time),
    );
  }

  Future<void> _chooseTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (time == null || !mounted) return;

    setState(() {
      selectedTime = time;
    });

    if (widget.isEdit) {
      _updateTime(time);
    } else {
      _updateCubit(time);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: _chooseTime,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: theme.colorScheme.primary),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Icon(Icons.schedule, color: theme.colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              selectedTime.format(context),
              style: AppStyles.regular16(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
