import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/medicine_details/domain/repos/medicine_details_repo.dart';

class GetMedicineDetailsUseCase {
  final MedicineDetailsRepo repository;

  GetMedicineDetailsUseCase(this.repository);

  Future<Either<Failure, HomeMedicineModel?>> call({
    required int medicineId,
  }) {
    return repository.getMedicineDetails(
      medicineId: medicineId,
    );
  }
}