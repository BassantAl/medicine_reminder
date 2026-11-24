import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/edit_medicine/domain/repos/edit_medicine_repo.dart';


class UpdateMedicineUseCase {
  final EditMedicineRepo repository;

  UpdateMedicineUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({
    required int medicineId,
    MedicineModel? medicine,
    DoesScheduleModel? schedule,
    List<DailyDoesModel>? dailyDoses,
  }) {
    return repository.updateMedicine(
      medicineId: medicineId,
      medicine: medicine,
      schedule: schedule,
      dailyDoses: dailyDoses,
    );
  }
}
