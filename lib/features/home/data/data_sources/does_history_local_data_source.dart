
import 'package:medicine_reminder/core/database/app_database.dart';
import 'package:medicine_reminder/core/enums/does_status_enum.dart';
import 'package:medicine_reminder/features/home/data/models/dose_history_model.dart';

class DoseHistoryLocalDataSource {
  final AppDatabase appDatabase;

  DoseHistoryLocalDataSource({
    required this.appDatabase,
  });

  Future<void> manageDoesHistory({
    required int dailyDoseId,
    required DateTime date,
    required String doseTime,
    required DoesStatusEnum status,
  }) async {
    final db = await appDatabase.database;

    final formattedDate = _formatDate(date);

    final doseHistory = DoseHistoryModel(
      dailyDoseId: dailyDoseId,
      scheduledDate: date,
      scheduledTime: doseTime,
      status: status,
    );

    await db.transaction((txn) async {
      final existingRecords = await txn.query(
        'DoseHistory',
        where: '''
          dailyDoseId = ?
          AND scheduledDate = ?
          AND scheduledTime = ?
        ''',
        whereArgs: [
          dailyDoseId,
          formattedDate,
          doseTime,
        ],
        limit: 1,
      );

      if (existingRecords.isNotEmpty) {
        await txn.update(
          'DoseHistory',
          {
            'status': status.name,
          },
          where: 'id = ?',
          whereArgs: [
            existingRecords.first['id'],
          ],
        );
      } else {
        final data = doseHistory.toMap();

        await txn.insert(
          'DoseHistory',
          data,
        );
      }
    });
  }

  String _formatDate(DateTime date) {
    return '${date.year}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }
}