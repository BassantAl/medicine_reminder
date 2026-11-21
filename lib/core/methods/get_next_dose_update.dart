import 'package:medicine_reminder/features/home/data/models/medicine_does_data.dart';

DateTime? getNextDoseUpdate({
  required List<MedicineDoseData> doses,
  required DateTime now,
}) {
  DateTime? nextUpdate;

  for (final dose in doses) {
    final historyExists = dose.medicine.doseHistories.any(
      (history) =>
          history.dailyDoseId == dose.dailyDose.id &&
          history.scheduledDate.year == now.year &&
          history.scheduledDate.month == now.month &&
          history.scheduledDate.day == now.day,
    );
    if (historyExists) continue;

    final parts = dose.doseTime.split(':');
    if (parts.length != 2) continue;

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    if (hour == null ||
        minute == null ||
        hour < 0 ||
        hour > 23 ||
        minute < 0 ||
        minute > 59) {
      continue;
    }
    final scheduledDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    final missedDataTime = scheduledDateTime.add(const Duration(minutes: 30));
    DateTime? candidate;

    if (now.isBefore(scheduledDateTime)) {
      candidate = scheduledDateTime;
    } else if (now.isBefore(missedDataTime)) {
      candidate = missedDataTime;
    }
    if (candidate != null &&
        (nextUpdate == null || candidate.isBefore(nextUpdate))) {
      nextUpdate = candidate;
    }
  }
  return nextUpdate;
}
