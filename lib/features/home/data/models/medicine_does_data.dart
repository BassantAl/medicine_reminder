import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';

class MedicineDoseData {
  final HomeMedicineModel medicine;
  final String doseTime;

  MedicineDoseData({
    required this.medicine,
    required this.doseTime,
  });
}