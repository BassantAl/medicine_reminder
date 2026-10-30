import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/add_medicine/domain/repos/add_medicine_repo.dart';

class AddMedicineUseCase {
  final AddMedicineRepo addMedicineRepo;
  AddMedicineUseCase({required this.addMedicineRepo});
  Future<Either<Failure, int>> addMedicine({
    required MedicineModel medicineModel,
    required DoesScheduleModel doesScheduleModel,
    required List<DailyDoesModel> dailyDoses,
  }) {
    return addMedicineRepo.addMedicine(
      medicineModel: medicineModel,
      doesScheduleModel: doesScheduleModel,
      dailyDoses: dailyDoses,
    );
  }
}
