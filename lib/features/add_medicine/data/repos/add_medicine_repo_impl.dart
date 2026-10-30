import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/add_medicine/data/data_sources/medicine_local_data_source.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/add_medicine/domain/repos/add_medicine_repo.dart';

class AddMedicineRepoImpl implements AddMedicineRepo {
  final MedicineLocalDataSource medicineLocalDataSource;
  AddMedicineRepoImpl({required this.medicineLocalDataSource});
  @override
  Future<Either<Failure, int>> addMedicine({
    required MedicineModel medicineModel,
    required DoesScheduleModel doesScheduleModel,
    required List<DailyDoesModel> dailyDoses,
  }) async {
    try {
      final result = await medicineLocalDataSource.saveMedicine(
        medicineModel: medicineModel,
        doesScheduleModel: doesScheduleModel,
        dailyDoses: dailyDoses,
      );
      return right(result);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
