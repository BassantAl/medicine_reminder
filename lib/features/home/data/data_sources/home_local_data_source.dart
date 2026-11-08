import 'package:medicine_reminder/core/database/app_database.dart';
import 'package:medicine_reminder/core/di/service_locator.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';

class HomeLocalDataSource {
  final database = getIt<AppDatabase>();
  Future<List<HomeMedicineModel>> getAllMedicines() async {
    final db = await database.database;
    final result = await db.rawQuery('''
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
        DailyDoes.doseAmount

      FROM Medicine

      LEFT JOIN DoesSchedule
      ON Medicine.id = DoesSchedule.medicineId

      LEFT JOIN DailyDoes
      ON DoesSchedule.id = DailyDoes.scheduleId

      ORDER BY Medicine.id DESC
    ''');

    final Map<int, MedicineModel> medicines = {};
    final Map<int, DoesScheduleModel?> schedules = {};
    final Map<int, List<DailyDoesModel>> dailyDoses = {};

    final Set<int> addedDailyDoseIds = {};

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
    }
    return medicines.entries.map((entry) {
      final medicineId = entry.key;
      return HomeMedicineModel(
        medicine: entry.value,
        schedule: schedules[medicineId],
        dailyDoses: dailyDoses[medicineId]!,
      );
    }).toList();
  }
}
