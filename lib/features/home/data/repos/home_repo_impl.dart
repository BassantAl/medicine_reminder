import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/home/data/data_sources/does_history_local_data_source.dart';
import 'package:medicine_reminder/features/home/data/data_sources/home_get_local_data_source.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl({
    required this.homeLocalDataSource,
    required this.doseHistoryLocalDataSource,
  });
  final HomeGetLocalDataSource homeLocalDataSource;
  final DoseHistoryLocalDataSource doseHistoryLocalDataSource;

  @override
  Future<Either<Failure, List<HomeMedicineModel>>> getAllMedicines() async {
    try {
      final medicines = await homeLocalDataSource.getAllMedicines();
      return Right(medicines);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> manageDoesHistory({
    required int dailyDoseId,
    required DateTime date,
    required List<String> doseTimes,
  }) async {
    try {
      await doseHistoryLocalDataSource.addDoesHistory(
        dailyDoseId: dailyDoseId,
        date: date,
        doseTimes: doseTimes,
      );
      return right(null);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
