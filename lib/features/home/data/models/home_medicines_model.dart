
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/home/data/models/dose_history_model.dart';

class HomeMedicineModel {
  final MedicineModel medicine;
  final DoesScheduleModel? schedule;
  final List<DailyDoesModel> dailyDoses;
  final List<DoseHistoryModel> doseHistories;

  HomeMedicineModel({
    required this.medicine,
    required this.schedule,
    required this.dailyDoses,
    required this.doseHistories,
  });
}
