import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';

class DoseTimesWidget extends StatefulWidget {
  const DoseTimesWidget({super.key, required this.index});

  final int index;

  @override
  State<DoseTimesWidget> createState() => _DoseTimesWidgetState();
}

class _DoseTimesWidgetState extends State<DoseTimesWidget> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();

    selectedTime = TimeOfDay.now();

    _updateCubit(selectedTime);
  }

  void _updateCubit(TimeOfDay time) {
    final formattedTime =
        '${time.hour.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}';

    context.read<AddMedicineCubit>().updateDoseTime(
      widget.index,
      formattedTime,
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

    _updateCubit(time);
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
          border: Border.all(
            width: 1,
            color: theme.colorScheme.primary,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Icon(
              Icons.schedule,
              color: theme.colorScheme.primary,
              size: 20,
            ),
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