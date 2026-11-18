import 'package:medicine_reminder/core/database/app_database.dart';
import 'package:medicine_reminder/core/di/service_locator.dart';
import 'package:medicine_reminder/core/methods/get_current_day_index.dart';

import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';

import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/home/data/models/dose_history_model.dart';

class HomeGetLocalDataSource {
  final database = getIt<AppDatabase>();

  Future<List<HomeMedicineModel>> getAllMedicines() async {
    final db = await database.database;

    final today = DateTime.now();

    final todayString =
        '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';

    final currentDayIndex = getCurrentDayIndex();

    final result = await db.rawQuery(
      '''
      SELECT
        Medicine.id AS medicineId,
        Medicine.name,
        Medicine.foodInstruction,
        Medicine.notes,

        DoesSchedule.id AS scheduleId,
        DoesSchedule.medicineId,
        DoesSchedule.frequency,
        DoesSchedule.selectedDays,
        DoesSchedule.doseTimes,
        DoesSchedule.startDate,
        DoesSchedule.endDate,
        DoesSchedule.enableNotifications,

        DailyDoes.id AS dailyDoseId,
        DailyDoes.scheduleId,
        DailyDoes.dayOfWeek,
        DailyDoes.doseAmount,

        DoseHistory.id AS doseHistoryId,
        DoseHistory.dailyDoseId AS historyDailyDoseId,
        DoseHistory.scheduledDate,
        DoseHistory.scheduledTime,
        DoseHistory.status AS doseStatus

      FROM Medicine

      LEFT JOIN DoesSchedule
        ON Medicine.id = DoesSchedule.medicineId
        AND date(?) >= date(DoesSchedule.startDate)
        AND (
          DoesSchedule.endDate IS NULL
          OR date(?) <= date(DoesSchedule.endDate)
        )

      LEFT JOIN DailyDoes
        ON DoesSchedule.id = DailyDoes.scheduleId
        AND DailyDoes.dayOfWeek = ?

      LEFT JOIN DoseHistory
        ON DailyDoes.id = DoseHistory.dailyDoseId
        AND DoseHistory.scheduledDate = ?

      ORDER BY Medicine.id DESC
      ''',
      [todayString, todayString, currentDayIndex, todayString],
    );

    final Map<int, MedicineModel> medicines = {};

    final Map<int, DoesScheduleModel?> schedules = {};

    final Map<int, List<DailyDoesModel>> dailyDoses = {};

    final Map<int, List<DoseHistoryModel>> doseHistories = {};

    final Set<int> addedDailyDoseIds = {};

    final Set<int> addedDoseHistoryIds = {};

    for (final item in result) {
      final medicineId = item['medicineId'] as int;

      medicines.putIfAbsent(
        medicineId,
        () => MedicineModel.fromMap(data: item),
      );

      schedules.putIfAbsent(
        medicineId,
        () => item['scheduleId'] == null
            ? null
            : DoesScheduleModel.fromMap(data: item),
      );

      dailyDoses.putIfAbsent(medicineId, () => []);

      final dailyDoseId = item['dailyDoseId'] as int?;

      if (dailyDoseId != null && addedDailyDoseIds.add(dailyDoseId)) {
        dailyDoses[medicineId]!.add(DailyDoesModel.fromMap(data: item));
      }

      doseHistories.putIfAbsent(medicineId, () => []);

      final doseHistoryId = item['doseHistoryId'] as int?;

      if (doseHistoryId != null && addedDoseHistoryIds.add(doseHistoryId)) {
        doseHistories[medicineId]!.add(
          DoseHistoryModel.fromMap(
            data: {
              'id': doseHistoryId,
              'dailyDoseId': item['historyDailyDoseId'],
              'scheduledDate': item['scheduledDate'],
              'scheduledTime': item['scheduledTime'],
              'status': item['doseStatus'],
            },
          ),
        );
      }
    }

    // Return medicines that have an active schedule
    // and a dose for today.
    return medicines.entries
        .where((entry) {
          final medicineId = entry.key;

          return schedules[medicineId] != null &&
              dailyDoses[medicineId]!.isNotEmpty;
        })
        .map((entry) {
          final medicineId = entry.key;

          return HomeMedicineModel(
            medicine: entry.value,
            schedule: schedules[medicineId],
            dailyDoses: dailyDoses[medicineId]!,
            doseHistories: doseHistories[medicineId]!,
          );
        })
        .toList();
  }
}
