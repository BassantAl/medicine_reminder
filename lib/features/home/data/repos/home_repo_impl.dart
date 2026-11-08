import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/home/data/data_sources/home_local_data_source.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl({required this.homeLocalDataSource});
  final HomeLocalDataSource homeLocalDataSource;

  @override
  Future<Either<Failure, List<HomeMedicineModel>>> getAllMedicines() async {
    try {
      final medicines = await homeLocalDataSource.getAllMedicines();
      return Right(medicines);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
