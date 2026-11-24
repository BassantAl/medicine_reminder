import 'package:medicine_reminder/core/database/app_database.dart';
import 'package:medicine_reminder/core/di/service_locator.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:sqflite/sqflite.dart';

class UpdateMedicineDetails {
  final database = getIt<AppDatabase>();
  Future<void> updateMedicine({
    required int medicineId,
    MedicineModel? medicine,
    DoesScheduleModel? schedule,
    List<DailyDoesModel>? dailyDoses,
  }) async {
    final db = await database.database;

    await db.transaction((txn) async {
      if (medicine != null) {
        final medRows = await txn.query(
          'Medicine',
          where: 'id = ?',
          whereArgs: [medicineId],
          limit: 1,
        );
        if (medRows.isEmpty) return;

        final medChanges = _diff(medRows.first, medicine.toMap());
        if (medChanges.isNotEmpty) {
          await txn.update(
            'Medicine',
            medChanges,
            where: 'id = ?',
            whereArgs: [medicineId],
          );
        }
      }

      int? scheduleId;

      if (schedule != null) {
        final schRows = await txn.query(
          'DoesSchedule',
          where: 'medicineId = ?',
          whereArgs: [medicineId],
          limit: 1,
        );

        if (schRows.isEmpty) {
          final map = schedule.toMap();
          map['medicineId'] = medicineId;
          scheduleId = await txn.insert('DoesSchedule', map);
        } else {
          scheduleId = schRows.first['id'] as int;

          final newMap = schedule.toMap()..remove('medicineId');
          final schChanges = _diff(schRows.first, newMap);

          if (schChanges.isNotEmpty) {
            await txn.update(
              'DoesSchedule',
              schChanges,
              where: 'id = ?',
              whereArgs: [scheduleId],
            );
          }
        }
      }

      if (dailyDoses != null) {
        if (scheduleId == null) {
          final rows = await txn.query(
            'DoesSchedule',
            columns: ['id'],
            where: 'medicineId = ?',
            whereArgs: [medicineId],
            limit: 1,
          );
          if (rows.isNotEmpty) scheduleId = rows.first['id'] as int;
        }

        // لا جدول = لا جرعات يومية
        if (scheduleId == null) return;

        final existingRows = await txn.query(
          'DailyDoes',
          where: 'scheduleId = ?',
          whereArgs: [scheduleId],
        );

        final existing = <int, Map<String, Object?>>{
          for (final r in existingRows) r['dayOfWeek'] as int: r,
        };

        final incomingDays = <int>{};

        for (final dose in dailyDoses) {
          incomingDays.add(dose.dayOfWeek);
          final old = existing[dose.dayOfWeek];

          if (old == null) {
            await txn.insert(
              'DailyDoes',
              DailyDoesModel(
                scheduleId: scheduleId,
                dayOfWeek: dose.dayOfWeek,
                doseAmount: dose.doseAmount,
              ).toMap(),
            );
          } else {
            final changes = _diff(old, {'doseAmount': dose.doseAmount});
            if (changes.isNotEmpty) {
              await txn.update(
                'DailyDoes',
                changes,
                where: 'id = ?',
                whereArgs: [old['id']],
              );
            }
          }
        }

        for (final entry in existing.entries) {
          if (incomingDays.contains(entry.key)) continue;
          final id = entry.value['id'] as int;

          await txn.delete(
            'DoseHistory',
            where: 'dailyDoseId = ? AND status = ?',
            whereArgs: [id, 'pending'],
          );

          final remaining = Sqflite.firstIntValue(
            await txn.rawQuery(
              'SELECT COUNT(*) FROM DoseHistory WHERE dailyDoseId = ?',
              [id],
            ),
          );

          if ((remaining ?? 0) == 0) {
            await txn.delete('DailyDoes', where: 'id = ?', whereArgs: [id]);
          }
        }
      }
    });
  }

  Map<String, Object?> _diff(
    Map<String, Object?> oldMap,
    Map<String, Object?> newMap,
  ) {
    final changes = <String, Object?>{};

    newMap.forEach((key, newValue) {
      final oldValue = oldMap[key];
      final same = (oldValue is num && newValue is num)
          ? oldValue.toDouble() == newValue.toDouble()
          : oldValue == newValue;

      if (!same) changes[key] = newValue;
    });

    return changes;
  }
}
