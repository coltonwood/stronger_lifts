import 'package:stronger_lifts/repository/database-creator.dart';

class Workout {
  int id;
  WorkoutType type;
  DateTime startTime;
  DateTime endTime;
  bool isDeleted = false;

  Duration get woDuration => endTime.difference(startTime);
  String get duration => '${woDuration.inMinutes}:${woDuration.inSeconds.toString().padLeft(2, '0')}';
  String get typeStr => type == WorkoutType.A ? 'A' : 'B';

  Workout(this.type, {overrideStartTime}) {
    startTime = overrideStartTime ?? DateTime.now();
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

  void assignId(int newId) => id = newId;

  void end([overrideEndTime]) {
    endTime = overrideEndTime ?? DateTime.now();
  }
}

enum WorkoutType { A, B }
