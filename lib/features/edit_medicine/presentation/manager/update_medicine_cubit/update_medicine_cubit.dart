import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:medicine_reminder/core/errors/failure.dart';

import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';

import 'package:medicine_reminder/features/edit_medicine/domain/use_cases/update_medicine_use_case.dart';

part 'update_medicine_state.dart';

class UpdateMedicineCubit extends Cubit<UpdateMedicineState> {
  final UpdateMedicineUseCase updateMedicineUseCase;

  UpdateMedicineCubit({required this.updateMedicineUseCase})
    : super(UpdateMedicineInitial());

  Future<void> updateMedicine({
    required int medicineId,
    MedicineModel? medicine,
    DoesScheduleModel? schedule,
    List<DailyDoesModel>? dailyDoses,
  }) async {
    emit(UpdateMedicineLoading());

    final result = await updateMedicineUseCase(
      medicineId: medicineId,
      medicine: medicine,
      schedule: schedule,
      dailyDoses: dailyDoses,
    );

    result.fold(
      (failure) {
        emit(UpdateMedicineFailure(failure));
      },
      (_) {
        emit(UpdateMedicineSuccess());
      },
    );
  }
}
