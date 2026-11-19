import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/core/enums/does_status_enum.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/home/presentation/manager/manage_does_history_cubit/manage_does_history_cubit.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/custom_skip_or_take_button.dart';

class CustomDoesCardButtons extends StatelessWidget {
  const CustomDoesCardButtons({super.key, required this.doseTime, required this.dailyDose});
  final String doseTime;
  final DailyDoesModel dailyDose;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomSkipOrTakeButton(
            action: DoseAction.take,
            onPressed: () {
              _updateStatus(context, DoesStatusEnum.taken);
            },
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomSkipOrTakeButton(
            action: DoseAction.skip,
            onPressed: () {
              _updateStatus(context, DoesStatusEnum.skipped);
            },
          ),
        ),
      ],
    );
  }
    void _updateStatus(BuildContext context, DoesStatusEnum status) {
    context.read<ManageDoesHistoryCubit>().manageDoesHistory(
      dailyDoseId: dailyDose.id!,
      date: DateTime.now(),
      doseTime: doseTime,
      status: status,
    );
  }
}

