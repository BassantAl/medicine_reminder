import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/dose_times_with_remove.dart';

class ManageRemoveAndAddDoseTimes extends StatefulWidget {
  const ManageRemoveAndAddDoseTimes({super.key});

  @override
  State<ManageRemoveAndAddDoseTimes> createState() =>
      _ManageRemoveAndAddDoseTimesState();
}

class _ManageRemoveAndAddDoseTimesState
    extends State<ManageRemoveAndAddDoseTimes> {
  int doseTimeCount = 2;

  @override
  void initState() {
    super.initState();

    context.read<AddMedicineCubit>().resetDoseTimes(doseTimeCount);
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
              index: index,
              onTap: () {
                if (doseTimeCount > 1) {
                  setState(() {
                    doseTimeCount--;
                  });

                  context.read<AddMedicineCubit>().removeDoseTime(index);
                }
              },
            ),
          ),

        TextButton(
          onPressed: () {
            setState(() {
              doseTimeCount++;
            });

            context.read<AddMedicineCubit>().addDoseTime();
          },
          child: Text(S.of(context).addDoseTime),
        ),
      ],
    );
  }
}