import 'package:bloc/bloc.dart';
import 'package:medicine_reminder/features/medicine_details/domain/use_cases/delete_medicine_use_case.dart';
import 'package:meta/meta.dart';

part 'delete_medicine_state.dart';

class DeleteMedicineCubit extends Cubit<DeleteMedicineState> {
  final DeleteMedicineUseCase deleteMedicineUseCase;

  DeleteMedicineCubit(this.deleteMedicineUseCase)
      : super(DeleteMedicineInitial());

  Future<void> deleteMedicine(int medicineId) async {
    emit(DeleteMedicineLoading());

    try {
      await deleteMedicineUseCase(medicineId);
      emit(DeleteMedicineSuccess());
    } catch (e) {
      emit(DeleteMedicineFailure(e.toString()));
    }
  }
}
