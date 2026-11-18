import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';

class MedicineDoseData {
  final HomeMedicineModel medicine;
  final String doseTime;
  final DailyDoesModel dailyDose;
  MedicineDoseData({
    required this.medicine,
    required this.doseTime,
    required this.dailyDose,
  });
}
