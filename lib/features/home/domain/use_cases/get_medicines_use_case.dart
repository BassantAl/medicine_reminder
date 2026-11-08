import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';

import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/home/domain/repos/home_repo.dart';

class GetMedicinesUseCase {
  GetMedicinesUseCase({required this.homeRepo});
  final HomeRepo homeRepo;
  Future<Either<Failure, List<HomeMedicineModel>>> getAllMedicines() async {
    return await homeRepo.getAllMedicines();
  }
}
