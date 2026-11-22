import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_active_and_inactive_week_day_widget.dart';

WeekDay getDayaName({required int day}) {
  switch (day) {
    case 0:
      return WeekDay.saturday;
    case 1:
      return WeekDay.sunday;

    case 2:
      return WeekDay.monday;

    case 3:
      return WeekDay.tuesday;

    case 4:
      return WeekDay.wednesday;

    case 5:
      return WeekDay.thursday;

    case 6:
      return WeekDay.friday;

    default:
      return WeekDay.friday;
  }
}
