import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<MedicineModel>>> getAllMedicines();
}
