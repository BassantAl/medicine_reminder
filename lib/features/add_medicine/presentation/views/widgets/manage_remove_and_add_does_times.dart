import 'package:flutter/material.dart';
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
  List<DoseTimesWithRemove> doseTimesWithRemoveItems = [
    DoseTimesWithRemove(),
    DoseTimesWithRemove(),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int index = 0; index < doseTimesWithRemoveItems.length; index++)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: DoseTimesWithRemove(
              onTap: () {
                doseTimesWithRemoveItems.removeAt(index);
                setState(() {
                  
                });
              },
            ),
          ),
        TextButton(
          onPressed: () {
            doseTimesWithRemoveItems.add(DoseTimesWithRemove());
            setState(() {
              
            });
          },
          child: Text(S.of(context).addDoseTime),
        ),
      ],
    );
  }
}
