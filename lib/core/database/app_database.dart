import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
    log('Database Path: $path');

    _database = await openDatabase(
      path,
      version: 2,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Medicine (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            foodInstruction TEXT,
            notes TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE DoesSchedule (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            medicineId INTEGER NOT NULL,
            frequency TEXT NOT NULL,
            selectedDays TEXT NOT NULL,
            doseTimes TEXT NOT NULL,
            startDate TEXT NOT NULL,
            endDate TEXT,
            enableNotifications INTEGER NOT NULL DEFAULT 1,
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
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('''
            ALTER TABLE Medicine ADD COLUMN notes TEXT
          ''');

          await db.execute('''
            ALTER TABLE DoesSchedule
            ADD COLUMN enableNotifications INTEGER NOT NULL DEFAULT 1
          ''');
        }
      },
    );

    return _database!;
  }
}
