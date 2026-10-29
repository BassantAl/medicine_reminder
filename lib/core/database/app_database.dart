import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'medicine_reminder.db');
    _database = await openDatabase(
      path,
      version: 1,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE Medicine (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            foodInstruction TEXT
          )''');
        await db.execute('''
          CREATE TABLE DoesSchedule (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            medicineId INTEGER NOT NULL,
            frequency TEXT NOT NULL,
            selectedDays TEXT NOT NULL,
            doseTimes TEXT NOT NULL,
            startDate TEXT NOT NULL,
            endDate TEXT,
            FOREIGN KEY (medicineId)
              REFERENCES Medicine(id)
              ON DELETE CASCADE
          )
        ''');
        await db.execute('''
          CREATE TABLE DailyDoes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            scheduleId INTEGER NOT NULL,
            dayOfWeek INTEGER NOT NULL,
            doseAmount REAL NOT NULL,
            FOREIGN KEY (scheduleId)
              REFERENCES DoesSchedule(id)
              ON DELETE CASCADE,
            UNIQUE (scheduleId, dayOfWeek)
          )
        ''');
      },
    );
    return _database!;
  }
}
