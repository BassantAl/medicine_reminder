import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/is_arabic.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_week_day_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';
enum WeekDay { saturday, sunday, monday, tuesday, wednesday, thursday, friday }

extension WeekDayExtension on WeekDay {
  String getLocal(BuildContext context) {
    final localization = S.of(context);
    switch (this) {
      case WeekDay.saturday:
        return localization.saturday;
      case WeekDay.sunday:
        return localization.sunday;
      case WeekDay.monday:
        return localization.monday;
      case WeekDay.tuesday:
        return localization.tuesday;
      case WeekDay.wednesday:
        return localization.wednesday;
      case WeekDay.thursday:
        return localization.thursday;
      case WeekDay.friday:
        return localization.friday;
    }
  }
}
class ManageActiveAndInactiveWeekDayWidget extends StatefulWidget {
  const ManageActiveAndInactiveWeekDayWidget({super.key});

  @override
  State<ManageActiveAndInactiveWeekDayWidget> createState() => _ManageActiveAndInactiveWeekDayWidgetState();
}

class _ManageActiveAndInactiveWeekDayWidgetState extends State<ManageActiveAndInactiveWeekDayWidget> {
    bool isSelected = false;
  List selectedDays = [];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: WeekDay.values.map((day) {
        final isDaySelected = selectedDays.contains(day);
        return Padding(
          padding: isArabic(context)
              ? const EdgeInsets.only(left: 8, bottom: 8, top: 12)
              : const EdgeInsets.only(right: 8.0, bottom: 8, top: 12),
          child: InkWell(
            onTap: () {
              setState(() {
                if (isDaySelected) {
                  selectedDays.remove(day);
                } else {
                  selectedDays.add(day);
                }
              });
            },
            child: CustomWeekDayWidget(
              isSelected: isDaySelected,
              title: day.getLocal(context),
            ),
          ),
        );
      }).toList(),
    );
  }
}
