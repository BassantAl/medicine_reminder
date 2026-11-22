import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';

abstract class MedicineDetailsRepo {
  Future<Either<Failure, HomeMedicineModel?>> getMedicineDetails({
    required int medicineId,
  });
}