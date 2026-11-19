import 'package:medicine_reminder/core/enums/does_status_enum.dart';
import 'package:medicine_reminder/features/home/data/models/dose_history_model.dart';

DoesStatusEnum getDoseStatus({
  required List<DoseHistoryModel> doseHistories,
  required int dailyDoseId,
  required DateTime date,
  required String doseTime,
}) {
  final history = doseHistories.where(
    (item) =>
        item.dailyDoseId == dailyDoseId &&
        item.scheduledDate.year == date.year &&
        item.scheduledDate.month == date.month &&
        item.scheduledDate.day == date.day &&
        item.scheduledTime == doseTime,
  );

  if (history.isNotEmpty) {
    return history.first.status;
  }

  final parts = doseTime.split(':');

  final scheduledDateTime = DateTime(
    date.year,
    date.month,
    date.day,
    int.parse(parts[0]),
    int.parse(parts[1]),
  );

  final now = DateTime.now();

  if (now.isBefore(scheduledDateTime)) {
    return DoesStatusEnum.upcoming;
  }

  final missedDateTime = scheduledDateTime.add(
    const Duration(minutes: 30),
  );

  if (!now.isBefore(missedDateTime)) {
    return DoesStatusEnum.missed;
  }

  return DoesStatusEnum.pending;
}