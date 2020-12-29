import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

Database db;

class DatabaseCreator {
  static const workoutsTable = 'workouts';
  static const id = 'id';
  static const type = 'type';
  static const startTime = 'startTime';
  static const endTime = 'endTime';
  static const isDeleted = 'isDeleted';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult]) {
    print(functionName);
    print(sql);
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createWorkoutsTable(Database db) async {
    final workoutsSql = '''CREATE TABLE $workoutsTable
    (
      $id INTEGER PRIMARY KEY,
      $type TEXT,
      $startTime TEXT NOT NULL,
      $endTime TEXT,
      $isDeleted BIT NOT NULL
    )''';

    await db.execute(workoutsSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    // make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      // await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('workouts_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
  }

  Future<void> onCreate(Database db, int version) async {
    await createWorkoutsTable(db);
  }
}
