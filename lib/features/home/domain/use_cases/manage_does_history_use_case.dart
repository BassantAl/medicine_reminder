import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/home/domain/repos/home_repo.dart';

class ManageDoesHistoryUseCase {
  final HomeRepo homeRepo;
  ManageDoesHistoryUseCase({required this.homeRepo});

  Future<Either<Failure, void>> manageDoesHistory({
    required int dailyDoseId,
    required DateTime date,
    required List<String> doseTimes,
  }) async {
   return  await homeRepo.manageDoesHistory(
      dailyDoseId: dailyDoseId,
      date: date,
      doseTimes: doseTimes,
    );
  }
}
