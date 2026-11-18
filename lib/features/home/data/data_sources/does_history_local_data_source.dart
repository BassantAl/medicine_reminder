import 'package:medicine_reminder/core/database/app_database.dart';
import 'package:medicine_reminder/features/home/data/models/dose_history_model.dart';
import 'package:sqflite/sqflite.dart';

class DoseHistoryLocalDataSource {
  final AppDatabase appDatabase;
  DoseHistoryLocalDataSource({required this.appDatabase});

  Future<void> addDoesHistory({
    required int dailyDoseId,
    required DateTime date,
    required List<String> doseTimes,
  }) async {
    final db = await appDatabase.database;

    await db.transaction((txn) async {
      for (final doestime in doseTimes) {
        final doseHistory = DoseHistoryModel(
          dailyDoseId: dailyDoseId,
          scheduledDate: date,
          scheduledTime: doestime,
        );
        await txn.insert(
          'DoseHistory',
          doseHistory.toMap(),
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
    });
  }


}
