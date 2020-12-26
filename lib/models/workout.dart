class Workout {
  DateTime startTime;

  Workout([startTime]) {
    startTime = startTime ?? DateTime.now();
  }

  Workout.fromJson(Map<String, dynamic> json) : startTime = json['startTime'];

  Map<String, dynamic> toJson() => {
        'startTime': startTime,
      };
}

enum WorkoutVariation { a, b }
