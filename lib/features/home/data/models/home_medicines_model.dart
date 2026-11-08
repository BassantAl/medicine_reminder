import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';

class HomeMedicineModel {
  final MedicineModel medicine;
  final DoesScheduleModel? schedule;
  final List<DailyDoesModel> dailyDoses;

  HomeMedicineModel({
    required this.medicine,
    required this.schedule,
    required this.dailyDoses,
  });
}