import 'package:bloc/bloc.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/home/domain/use_cases/get_medicines_use_case.dart';
import 'package:meta/meta.dart';

part 'get_all_medicines_state.dart';

class GetAllMedicinesCubit extends Cubit<GetAllMedicinesState> {
  final GetMedicinesUseCase getMedicinesUseCase;
  GetAllMedicinesCubit({required this.getMedicinesUseCase})
    : super(GetAllMedicinesInitial());

  Future<void> getAllMedicines() async {
    emit(GetAllMedicinesLoading());
    final result = await getMedicinesUseCase.getAllMedicines();
    result.fold(
      (failure) {
        emit(GetAllMedicinesFailure(errorMessage: failure.errorMessage));
      },
      (medicines) {
        emit(GetAllMedicinesSuccess(medicines: medicines));
      },
    );
  }
}
