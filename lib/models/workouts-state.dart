import 'package:flutter/material.dart';
import 'package:stronger_lifts/models/workout.dart';
import 'package:stronger_lifts/repository/repository-service-workout.dart';

class WorkoutsState extends ChangeNotifier {
  List<Workout> workouts = List();
  Workout _currentWorkout;
  Workout get currentWorkout => _currentWorkout;
  bool get workoutInProgress => currentWorkout != null;

  WorkoutsState() {
    getWorkouts();
  }

  Future<void> getWorkouts() async {
    workouts = await RepositoryServiceWorkout.getAllWorkouts();
    notifyListeners();
  }

  Future<void> startWorkout(WorkoutType variation) async {
    _currentWorkout = Workout(variation);
    final id = await RepositoryServiceWorkout.startWorkout(_currentWorkout);
    _currentWorkout.assignId(id);
    getWorkouts();
    notifyListeners();
  }

  Future<void> endWorkout() async {
    _currentWorkout.end();
    await RepositoryServiceWorkout.endWorkout(_currentWorkout);
    _currentWorkout = null;
    getWorkouts();
    notifyListeners();
  }
}
