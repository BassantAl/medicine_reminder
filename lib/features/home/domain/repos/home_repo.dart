import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HomeMedicineModel>>> getAllMedicines();
  Future<Either<Failure, void>> manageDoesHistory({
    required int dailyDoseId,
    required DateTime date,
    required List<String> doseTimes,
  });
}
