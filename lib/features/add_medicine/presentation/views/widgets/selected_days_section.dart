import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_radio_list_title.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_active_and_inactive_week_day_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class SelectedDaysSection extends StatefulWidget {
  const SelectedDaysSection({super.key});

  @override
  State<SelectedDaysSection> createState() => _SelectedDaysSectionState();
}

class _SelectedDaysSectionState extends State<SelectedDaysSection> {
  String selectedItem = 'daily';
  bool isSelected = false;
  List selectedDays = [];
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(localization.selectedDays),
        const SizedBox(height: 5),
        RadioGroup(
          groupValue: selectedItem,
          onChanged: (value) {
            selectedItem = value as String;
            setState(() {});
          },
          child: Column(
            children: [
              CustomRadioListTitle(
                isSelected: selectedItem == 'daily',
                title: localization.scheduleEveryDay,
                value: 'daily',
              ),
              const SizedBox(height: 12),
              CustomRadioListTitle(
                isSelected: selectedItem == 'custom',
                title: localization.selectedDays,
                value: 'custom',
              ),
              if (selectedItem == 'custom')
                ManageActiveAndInactiveWeekDayWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
