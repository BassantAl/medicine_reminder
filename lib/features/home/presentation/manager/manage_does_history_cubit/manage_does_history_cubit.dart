import 'package:bloc/bloc.dart';
import 'package:medicine_reminder/features/home/domain/use_cases/manage_does_history_use_case.dart';
import 'package:meta/meta.dart';

part 'manage_does_history_state.dart';

class ManageDoesHistoryCubit extends Cubit<ManageDoesHistoryState> {
  ManageDoesHistoryCubit({required this.manageDoesHistoryUseCase})
    : super(ManageDoesHistoryInitial());
  final ManageDoesHistoryUseCase manageDoesHistoryUseCase;

  Future<void> manageDoesHistory({
    required int dailyDoseId,
    required DateTime date,
    required List<String> doseTimes,
  }) async {
    emit(ManageDoesHistoryLoading());
    final result = await manageDoesHistoryUseCase.manageDoesHistory(
      dailyDoseId: dailyDoseId,
      date: date,
      doseTimes: doseTimes,
    );
    result.fold(
      (failure) {
        emit(ManageDoesHistoryFailure(errorMessage: failure.errorMessage));
      },
      (_) {
        emit(ManageDoesHistorySuccess());
      },
    );
  }
}
