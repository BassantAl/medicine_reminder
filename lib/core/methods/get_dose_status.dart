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
      final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

   if (hour == null ||
    minute == null ||
    hour < 0 ||
    hour > 23 ||
    minute < 0 ||
    minute > 59) {
  return DoesStatusEnum.upcoming;
}

  final scheduledDateTime = DateTime(
    date.year,
    date.month,
    date.day,
    hour,
    minute,
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