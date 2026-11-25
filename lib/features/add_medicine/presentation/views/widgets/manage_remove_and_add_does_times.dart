import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/dose_times_with_remove.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class ManageRemoveAndAddDoseTimes extends StatefulWidget {
  const ManageRemoveAndAddDoseTimes({
    super.key,
    required this.isEdit,
  });

  final bool isEdit;

  @override
  State<ManageRemoveAndAddDoseTimes> createState() =>
      _ManageRemoveAndAddDoseTimesState();
}

class _ManageRemoveAndAddDoseTimesState
    extends State<ManageRemoveAndAddDoseTimes> {
  late int doseTimeCount;

  @override
  void initState() {
    super.initState();

    if (widget.isEdit) {
      doseTimeCount = context
          .read<UpdateMedicineCubit>()
          .doseTimes
          .length;
    } else {
      doseTimeCount = 2;

      context.read<AddMedicineCubit>().resetDoseTimes(doseTimeCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int index = 0; index < doseTimeCount; index++)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: DoseTimesWithRemove(
              isEdit: widget.isEdit,
              index: index,
              onTap: () {
                if (doseTimeCount > 1) {
                  setState(() {
                    doseTimeCount--;
                  });

                  if (widget.isEdit) {
                    context.read<UpdateMedicineCubit>().removeDoseTime(index);
                  } else {
                    context.read<AddMedicineCubit>().removeDoseTime(index);
                  }
                }
              },
            ),
          ),

        TextButton(
          onPressed: () {
            setState(() {
              doseTimeCount++;
            });

            if (widget.isEdit) {
              context.read<UpdateMedicineCubit>().addDoseTime();
            } else {
              context.read<AddMedicineCubit>().addDoseTime();
            }
          },
          child: Text(S.of(context).addDoseTime),
        ),
      ],
    );
  }
}