import 'package:medicine_reminder/core/database/app_database.dart';
import 'package:medicine_reminder/core/di/service_locator.dart';

import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';

import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/home/data/models/dose_history_model.dart';

class MedicineDetailsLocalDataSource {
  final database = getIt<AppDatabase>();

  Future<HomeMedicineModel?> getMedicineDetails({
    required int medicineId,
  }) async {
    final db = await database.database;

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

      LEFT JOIN DailyDoes
        ON DoesSchedule.id = DailyDoes.scheduleId

      LEFT JOIN DoseHistory
        ON DailyDoes.id = DoseHistory.dailyDoseId

      WHERE Medicine.id = ?

      ORDER BY DailyDoes.dayOfWeek ASC
      ''',
      [medicineId],
    );

    if (result.isEmpty) return null;

    final medicine = MedicineModel.fromMap(data: result.first);

    final schedule = result.first['scheduleId'] == null
        ? null
        : DoesScheduleModel.fromMap(data: result.first);

    final Map<int, DailyDoesModel> dailyDoses = {};

    final Map<int, DoseHistoryModel> doseHistories = {};

    for (final item in result) {
      final dailyDoseId = item['dailyDoseId'] as int?;

      if (dailyDoseId != null) {
        dailyDoses.putIfAbsent(
          dailyDoseId,
          () => DailyDoesModel.fromMap(data: item),
        );
      }

      final historyId = item['doseHistoryId'] as int?;

      if (historyId != null) {
        doseHistories.putIfAbsent(
          historyId,
          () => DoseHistoryModel.fromMap(
            data: {
              'id': historyId,
              'dailyDoseId': item['historyDailyDoseId'],
              'scheduledDate': item['scheduledDate'],
              'scheduledTime': item['scheduledTime'],
              'status': item['doseStatus'],
            },
          ),
        );
      }
    }

    return HomeMedicineModel(
      medicine: medicine,
      schedule: schedule,
      dailyDoses: dailyDoses.values.toList(),
      doseHistories: doseHistories.values.toList(),
    );
  }

  Future<void> deleteMedicine(int medicineId) async {
    final db = await database.database;

    await db.transaction((txn) async {
      final schedules = await txn.query(
        'DoesSchedule',
        columns: ['id'],
        where: 'medicineId = ?',
        whereArgs: [medicineId],
      );

      for (final schedule in schedules) {
        final dailyDoses = await txn.query(
          'DailyDoes',
          columns: ['id'],
          where: 'scheduleId = ?',
          whereArgs: [schedule['id']],
        );

        for (final dailyDose in dailyDoses) {
          await txn.delete(
            'DoseHistory',
            where: 'dailyDoseId = ?',
            whereArgs: [dailyDose['id']],
          );
        }

        await txn.delete(
          'DailyDoes',
          where: 'scheduleId = ?',
          whereArgs: [schedule['id']],
        );
      }

      await txn.delete(
        'DoesSchedule',
        where: 'medicineId = ?',
        whereArgs: [medicineId],
      );

      await txn.delete('Medicine', where: 'id = ?', whereArgs: [medicineId]);
    });
  }
}
