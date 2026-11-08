import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/home/domain/repos/home_repo.dart';

class GetMedicinesUseCase {
  GetMedicinesUseCase({required this.homeRepo});
  final HomeRepo homeRepo;
  Future<Either<Failure, List<MedicineModel>>> getAllMedicines() async {
    return await homeRepo.getAllMedicines();
  }
}
