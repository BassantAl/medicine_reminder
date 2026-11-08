import 'package:medicine_reminder/core/database/app_database.dart';
import 'package:medicine_reminder/core/di/service_locator.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';

class HomeLocalDataSource {
  final database = getIt<AppDatabase>();
  Future<List<MedicineModel>> getAllMedicines() async {
    final db = await database.database;
    final result = await db.query('Medicine', orderBy: 'id DESC');

    return result.map((element) {
      return MedicineModel.fromMap(data: element);
    }).toList();
  }
}
