import 'package:dartz/dartz.dart';
import 'package:medicine_reminder/core/errors/failure.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/medicine_details/data/data_sources/medicine_details_local_data_source.dart';
import 'package:medicine_reminder/features/medicine_details/domain/repos/medicine_details_repo.dart';

class MedicineDetailsRepoImpl extends MedicineDetailsRepo {
  final MedicineDetailsLocalDataSource localDataSource;

  MedicineDetailsRepoImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, HomeMedicineModel?>> getMedicineDetails({
    required int medicineId,
  }) async {
    try {
      final result = await localDataSource.getMedicineDetails(
        medicineId: medicineId,
      );

      return Right(result);
    } catch (e) {
      return Left(
        Failure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}