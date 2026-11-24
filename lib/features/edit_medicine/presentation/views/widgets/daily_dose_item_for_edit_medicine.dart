import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/widgets/daily_dose_item.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_active_and_inactive_week_day_widget.dart';

class DailyDoseItemForEditMedicine extends StatelessWidget {
  const DailyDoseItemForEditMedicine({super.key, required this.day, required this.sameDoseEveryDay, this.hintText});

  final WeekDay day;
  final bool sameDoseEveryDay;
final String? hintText;
  @override
  Widget build(BuildContext context) {

    return DailyDoseItem(
      hintText: hintText ,
      day: day,
      sameDoseEveryDay: sameDoseEveryDay,
      onSaved: (value) {
       
      },
    );
  }
}