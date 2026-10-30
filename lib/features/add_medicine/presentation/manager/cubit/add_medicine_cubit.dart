import 'package:bloc/bloc.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/add_medicine/domain/use_cases/add_medicine_use_case.dart';
import 'package:meta/meta.dart';

part 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  AddMedicineCubit({required this.addMedicineUseCase})
    : super(AddMedicineInitial());
  final AddMedicineUseCase addMedicineUseCase;
  Future<void> addMedicine({
    required MedicineModel medicineModel,
    required DoesScheduleModel doesScheduleModel,
    required List<DailyDoesModel> dailyDoses,
  }) async {
    emit(AddMedicineLoading());
    final result = await addMedicineUseCase.addMedicine(
      medicineModel: medicineModel,
      doesScheduleModel: doesScheduleModel,
      dailyDoses: dailyDoses,
    );
    result.fold(
      (failure) {
        emit(AddMedicineFailure(errorMessage: failure.errorMessage));
      },
      (medicineId) {
        emit(AddMedicineSuccess(medicineId: medicineId));
      },
    );
  }
}
