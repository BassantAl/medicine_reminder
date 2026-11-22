import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/medicine_details/domain/use_cases/get_medicine_details_use_case.dart';

part 'get_medicine_details_state.dart';

class GetMedicineDetailsCubit extends Cubit<GetMedicineDetailsState> {
  GetMedicineDetailsCubit(this.getMedicineDetailsUseCase)
      : super(GetMedicineDetailsInitial());

  final GetMedicineDetailsUseCase getMedicineDetailsUseCase;

  Future<void> getMedicineDetails({
    required int medicineId,
  }) async {
    emit(GetMedicineDetailsLoading());

    final result = await getMedicineDetailsUseCase.call(
      medicineId: medicineId,
    );

    result.fold(
      (failure) {
        emit(GetMedicineDetailsFailure(failure.errorMessage));
      },
      (medicine) {
        if (medicine == null) {
          emit(GetMedicineDetailsNotFound());
        } else {
          emit(GetMedicineDetailsSuccess(medicine));
        }
      },
    );
  }
}