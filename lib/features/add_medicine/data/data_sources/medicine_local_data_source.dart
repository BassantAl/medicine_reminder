import 'package:medicine_reminder/core/database/app_database.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';

class MedicineLocalDataSource {
  final AppDatabase appDatabase;
  MedicineLocalDataSource({required this.appDatabase});

  Future<int> saveMedicine({
    required MedicineModel medicineModel,
    required DoesScheduleModel doesScheduleModel,
    required List<DailyDoesModel> dailyDoses,
  }) async {
    final db = await appDatabase.database;
    return await db.transaction((txn) async {
      final medicineId = await txn.insert('Medicine', medicineModel.toMap());

      final schedule = DoesScheduleModel(
        medicineId: medicineId,
        frequency: doesScheduleModel.frequency,
        selectedDays: doesScheduleModel.selectedDays,
        doseTimes: doesScheduleModel.doseTimes,
        startDate: doesScheduleModel.startDate,
        endDate: doesScheduleModel.endDate,
      );
      final scheduleId = await txn.insert('DoesSchedule', schedule.toMap());
      for (final dailyDose in dailyDoses) {
        final dailyDoseModel = DailyDoesModel(
          scheduleId: scheduleId,
          dayOfWeek: dailyDose.dayOfWeek,
          doseAmount: dailyDose.doseAmount,
        );
        await txn.insert('DailyDoes', dailyDoseModel.toMap());
      }
      return medicineId;
    });
  }
}
