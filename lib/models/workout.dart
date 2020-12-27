class Workout {
  DateTime startTime;
  WorkoutType woType;
  String get type => woType == WorkoutType.A ? 'A' : 'B';

  Workout(this.woType, {this.startTime}) {
    startTime = startTime ?? DateTime.now();
  }

  Workout.fromJson(Map<String, dynamic> json)
      : woType = json['woType'] == WorkoutType.A.toString() ? WorkoutType.A : WorkoutType.B,
        startTime = DateTime.parse(json['startTime']);

  Map<String, dynamic> toJson() => {
        'woType': woType.toString(),
        'startTime': startTime.toString(),
      };
}

enum WorkoutType { A, B }
