import 'package:medicine_reminder/features/medicine_details/domain/repos/medicine_details_repo.dart';

class DeleteMedicineUseCase {
  final MedicineDetailsRepo repository;

  DeleteMedicineUseCase(this.repository);

  Future<void> call(int medicineId) {
    return repository.deleteMedicine(medicineId);
  }
}
