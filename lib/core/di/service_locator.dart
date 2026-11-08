import 'package:get_it/get_it.dart';
import 'package:medicine_reminder/core/database/app_database.dart';
import 'package:medicine_reminder/features/add_medicine/data/data_sources/medicine_local_data_source.dart';
import 'package:medicine_reminder/features/add_medicine/data/repos/add_medicine_repo_impl.dart';
import 'package:medicine_reminder/features/add_medicine/domain/repos/add_medicine_repo.dart';
import 'package:medicine_reminder/features/add_medicine/domain/use_cases/add_medicine_use_case.dart';
import 'package:medicine_reminder/features/home/data/data_sources/home_local_data_source.dart';
import 'package:medicine_reminder/features/home/data/repos/home_repo_impl.dart';
import 'package:medicine_reminder/features/home/domain/repos/home_repo.dart';
import 'package:medicine_reminder/features/home/domain/use_cases/get_medicines_use_case.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerSingleton<AppDatabase>(AppDatabase.instance);
  getIt.registerSingleton<MedicineLocalDataSource>(
    MedicineLocalDataSource(appDatabase: getIt.get<AppDatabase>()),
  );
  getIt.registerLazySingleton<AddMedicineRepo>(
    () => AddMedicineRepoImpl(
      medicineLocalDataSource: getIt<MedicineLocalDataSource>(),
    ),
  );
  getIt.registerLazySingleton<AddMedicineUseCase>(() {
    return AddMedicineUseCase(addMedicineRepo: getIt<AddMedicineRepo>());
  });

  getIt.registerLazySingleton<HomeLocalDataSource>(() {
    return HomeLocalDataSource();
  });

  getIt.registerLazySingleton<HomeRepo>(() {
    return HomeRepoImpl(homeLocalDataSource: getIt<HomeLocalDataSource>());
  });

  getIt.registerLazySingleton<GetMedicinesUseCase>(() {
    return GetMedicinesUseCase(homeRepo: getIt<HomeRepo>());
  });
}
