import 'package:get_it/get_it.dart';
import 'package:medicine_reminder/core/database/app_database.dart';
import 'package:medicine_reminder/features/add_medicine/data/data_sources/medicine_local_data_source.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerSingleton<AppDatabase>(AppDatabase.instance);
  getIt.registerSingleton<MedicineLocalDataSource>(
    MedicineLocalDataSource(appDatabase: getIt.get<AppDatabase>()),
  );
}
