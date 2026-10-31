import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_date_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class OngoingMedicationWidget extends StatefulWidget {
  const OngoingMedicationWidget({super.key});

  @override
  State<OngoingMedicationWidget> createState() =>
      _OngoingMedicationWidgetState();
}

class _OngoingMedicationWidgetState extends State<OngoingMedicationWidget> {
  bool isOngoing = true;
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(localization.ongoingMedication),
          subtitle: Text(localization.noPlannedEndDate),
          trailing: Switch(
            value: isOngoing,
            onChanged: (value) {
              setState(() {
                isOngoing = value;
              });
            },
          ),
        ),
        if (isOngoing == false)
          CustomDateWidget(title: localization.endDate, isStartDate: false),
      ],
    );
  }
}
