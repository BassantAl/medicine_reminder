import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/edit_medicine/data/data_sources/update_medicine_details.dart';
import 'package:medicine_reminder/features/edit_medicine/domain/repos/edit_medicine_repo.dart';

class EditMedicineRepoImpl extends EditMedicineRepo {
  EditMedicineRepoImpl({required this.localDataSource});
  final UpdateMedicineDetails localDataSource;
  @override
  Future<Either<Failure, Unit>> updateMedicine({
    required int medicineId,
    MedicineModel? medicine,
    DoesScheduleModel? schedule,
    List<DailyDoesModel>? dailyDoses,
  }) async {
    try {
      await localDataSource.updateMedicine(
        medicineId: medicineId,
        medicine: medicine,
        schedule: schedule,
        dailyDoses: dailyDoses,
      );

      return right(unit);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
