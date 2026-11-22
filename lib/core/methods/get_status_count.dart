import 'package:medicine_reminder/core/enums/does_status_enum.dart';
import 'package:medicine_reminder/core/methods/get_dose_status.dart';
import 'package:medicine_reminder/features/home/data/models/medicine_does_data.dart';

Map<DoesStatusEnum, int> getStatusCounts({
  required List<MedicineDoseData> allDoses,
}) {
  final counts = {
    DoesStatusEnum.taken: 0,
    DoesStatusEnum.skipped: 0,
    DoesStatusEnum.pending: 0,
    DoesStatusEnum.missed: 0,
    DoesStatusEnum.upcoming: 0,
  };

  for (final dose in allDoses) {
    final status = getDoseStatus(
      doseHistories: dose.medicine.doseHistories,
      dailyDoseId: dose.dailyDose.id!,
      date: DateTime.now(),
      doseTime: dose.doseTime,
    );

    counts[status] = counts[status]! + 1;
  }

  return counts;
}
