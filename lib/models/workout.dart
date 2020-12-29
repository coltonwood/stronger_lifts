import 'package:stronger_lifts/repository/database-creator.dart';
import 'package:stronger_lifts/repository/repository-service-workout.dart';

class Workout {
  Future initDone;
  int id;
  WorkoutType type;
  DateTime startTime;
  DateTime endTime;
  bool isDeleted = false;

  Duration get woDuration => endTime.difference(startTime);
  String get duration => '${woDuration.inHours}:${woDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}';
  String get typeStr => type == WorkoutType.A ? 'A' : 'B';

  Workout(this.type, {overrideStartTime}) {
    startTime = overrideStartTime ?? DateTime.now();
    initDone = start();
  }

  Workout.fromJson(Map<String, dynamic> json)
      : id = json[DatabaseCreator.id],
        type = json[DatabaseCreator.type] == 'A' ? WorkoutType.A : WorkoutType.B,
        startTime = json[DatabaseCreator.startTime] != null ? DateTime.parse(json[DatabaseCreator.startTime]) : null,
        endTime = json[DatabaseCreator.endTime] != null ? DateTime.parse(json[DatabaseCreator.endTime]) : null,
        isDeleted = json[DatabaseCreator.isDeleted] == 1;

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'type': typeStr,
        'startTime': startTime.toString(),
        'endTime': endTime.toString(),
        'isDeleted': isDeleted.toString(),
      };

  Future<void> start() async {
    id = await RepositoryServiceWorkout.startWorkout(this);
  }

  Future<void> end([overrideEndTime]) async {
    await RepositoryServiceWorkout.endWorkout(this);
  }
}

enum WorkoutType { A, B }
