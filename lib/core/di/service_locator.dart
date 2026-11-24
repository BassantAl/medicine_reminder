import 'package:get_it/get_it.dart';
import 'package:medicine_reminder/core/database/app_database.dart';
import 'package:medicine_reminder/features/add_medicine/data/data_sources/medicine_local_data_source.dart';
import 'package:medicine_reminder/features/add_medicine/data/repos/add_medicine_repo_impl.dart';
import 'package:medicine_reminder/features/add_medicine/domain/repos/add_medicine_repo.dart';
import 'package:medicine_reminder/features/add_medicine/domain/use_cases/add_medicine_use_case.dart';
import 'package:medicine_reminder/features/edit_medicine/data/data_sources/update_medicine_details.dart';
import 'package:medicine_reminder/features/edit_medicine/data/repos/edit_medicine_repo_impl.dart';
import 'package:medicine_reminder/features/edit_medicine/domain/repos/edit_medicine_repo.dart';
import 'package:medicine_reminder/features/home/data/data_sources/does_history_local_data_source.dart';
import 'package:medicine_reminder/features/home/data/data_sources/home_get_local_data_source.dart';
import 'package:medicine_reminder/features/home/data/repos/home_repo_impl.dart';
import 'package:medicine_reminder/features/home/domain/repos/home_repo.dart';
import 'package:medicine_reminder/features/home/domain/use_cases/get_medicines_use_case.dart';
import 'package:medicine_reminder/features/home/domain/use_cases/manage_does_history_use_case.dart';
import 'package:medicine_reminder/features/medicine_details/data/data_sources/medicine_details_local_data_source.dart';
import 'package:medicine_reminder/features/medicine_details/data/repos/medicine_details_repo_impl.dart';
import 'package:medicine_reminder/features/medicine_details/domain/repos/medicine_details_repo.dart';
import 'package:medicine_reminder/features/medicine_details/domain/use_cases/delete_medicine_use_case.dart';
import 'package:medicine_reminder/features/medicine_details/domain/use_cases/get_medicine_details_use_case.dart';
import 'package:medicine_reminder/features/edit_medicine/domain/use_cases/update_medicine_use_case.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/manager/delete_medicine_cubit/delete_medicine_cubit.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/manager/get_medicine_details_cubit/get_medicine_details_cubit.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';

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

  getIt.registerLazySingleton<HomeGetLocalDataSource>(() {
    return HomeGetLocalDataSource();
  });
  getIt.registerLazySingleton<DoseHistoryLocalDataSource>(() {
    return DoseHistoryLocalDataSource(appDatabase: getIt.get<AppDatabase>());
  });

  getIt.registerLazySingleton<HomeRepo>(() {
    return HomeRepoImpl(
      homeLocalDataSource: getIt<HomeGetLocalDataSource>(),
      doseHistoryLocalDataSource: getIt<DoseHistoryLocalDataSource>(),
    );
  });
  getIt.registerLazySingleton<ManageDoesHistoryUseCase>(() {
    return ManageDoesHistoryUseCase(homeRepo: getIt<HomeRepo>());
  });

  getIt.registerLazySingleton<GetMedicinesUseCase>(() {
    return GetMedicinesUseCase(homeRepo: getIt<HomeRepo>());
  });

  getIt.registerLazySingleton<MedicineDetailsLocalDataSource>(() {
    return MedicineDetailsLocalDataSource();
  });

  getIt.registerLazySingleton<MedicineDetailsRepo>(() {
    return MedicineDetailsRepoImpl(
      localDataSource: getIt<MedicineDetailsLocalDataSource>(),
    );
  });

  getIt.registerLazySingleton<GetMedicineDetailsUseCase>(() {
    return GetMedicineDetailsUseCase(getIt<MedicineDetailsRepo>());
  });

  getIt.registerLazySingleton<DeleteMedicineUseCase>(() {
    return DeleteMedicineUseCase(getIt<MedicineDetailsRepo>());
  });

  getIt.registerLazySingleton<UpdateMedicineDetails>(
    () => UpdateMedicineDetails(),
  );
  getIt.registerLazySingleton<EditMedicineRepo>(
    () => EditMedicineRepoImpl(localDataSource: getIt<UpdateMedicineDetails>()),
  );

  getIt.registerLazySingleton<UpdateMedicineUseCase>(
    () => UpdateMedicineUseCase(repository: getIt<EditMedicineRepo>()),
  );

  getIt.registerFactory<UpdateMedicineCubit>(
    () => UpdateMedicineCubit(
      updateMedicineUseCase: getIt<UpdateMedicineUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => GetMedicineDetailsCubit(getIt<GetMedicineDetailsUseCase>()),
  );

  getIt.registerFactory(
    () => DeleteMedicineCubit(getIt<DeleteMedicineUseCase>()),
  );
}
