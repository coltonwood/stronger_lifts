class Workout {
  int _id;
  WorkoutVariation _variation;
  // List<Exercise> _exercises;
  // List<WorkoutSet> _warmups;
  // List<WorkoutSet> _sets;

  Workout(WorkoutVariation variation) {
    _variation = variation;
    if (variation == WorkoutVariation.a) {
      print('A');
    } else if (variation == WorkoutVariation.b) {
      print('B');
    }
  }

  // getters
  int get id => _id;
  WorkoutVariation get type => _variation;

  // actions
  void startWorkout(String type) {
    // save
  }
}

enum WorkoutVariation { a, b }

class Exercise {}

class WorkoutSet {}
