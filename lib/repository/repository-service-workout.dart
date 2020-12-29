import 'package:stronger_lifts/models/workout.dart';
import 'package:stronger_lifts/repository/database-creator.dart';

class RepositoryServiceWorkout {
  static Future<List<Workout>> getAllWorkouts() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.workoutsTable}
    WHERE ${DatabaseCreator.isDeleted} == 0
    ORDER BY ${DatabaseCreator.endTime} DESC''';
    final data = await db.rawQuery(sql);
    List<Workout> workouts = List();

    for (final node in data) {
      final workout = Workout.fromJson(node);
      workouts.add(workout);
    }
    return workouts;
  }

  static Future<Workout> getWorkout(int id) async {
    final sql = '''SELECT * FROM ${DatabaseCreator.workoutsTable}
    WHERE ${DatabaseCreator.id} == $id''';
    final data = await db.rawQuery(sql);

    final workout = Workout.fromJson(data[0]);
    return workout;
  }

  static Future<int> startWorkout(Workout workout) async {
    final sql = '''INSERT INTO ${DatabaseCreator.workoutsTable}
    (
      ${DatabaseCreator.type},
      ${DatabaseCreator.startTime},
      ${DatabaseCreator.isDeleted}
    )
    VALUES
    (
      "${workout.typeStr}",
      "${workout.startTime}",
      ${workout.isDeleted ? 1 : 0}
    )''';

    final result = await db.rawInsert(sql);
    // DatabaseCreator.databaseLog('Add workout', sql, null, result);

    return result;
  }

  static Future<void> endWorkout(Workout workout) async {
    final sql = '''UPDATE ${DatabaseCreator.workoutsTable}
    SET ${DatabaseCreator.endTime} = "${DateTime.now().toString()}"
    WHERE ${DatabaseCreator.id} == ${workout.id}
    ''';

    final result = await db.rawUpdate(sql);
    DatabaseCreator.databaseLog('End workout', sql, null, result);
  }

  static Future<void> deleteWorkout(Workout workout) async {
    final sql = '''UPDATE ${DatabaseCreator.workoutsTable}
    SET ${DatabaseCreator.isDeleted} = 1
    WHERE ${DatabaseCreator.id} == ${workout.id}
    ''';

    final result = await db.rawUpdate(sql);
    DatabaseCreator.databaseLog('Delete workout', sql, null, result);
  }

  static Future<void> updateWorkout(Workout workout) async {
    final sql = '''UPDATE ${DatabaseCreator.workoutsTable}
    SET ${DatabaseCreator.type} = "${workout.type}"
    WHERE ${DatabaseCreator.id} = ${workout.id}
    ''';

    final result = await db.rawUpdate(sql);
    DatabaseCreator.databaseLog('Update workout', sql, null, result);
  }

  static Future<int> workoutsCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.workoutsTable}''');

    int count = data[0].values.elementAt(0);
    return count;
  }
}
