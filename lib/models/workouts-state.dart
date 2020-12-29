import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stronger_lifts/models/timer.dart';
import 'package:stronger_lifts/models/workout.dart';
import 'package:stronger_lifts/repository/repository-service-workout.dart';

class WorkoutsState extends ChangeNotifier {
  List<Workout> workouts = List();
  Workout currentWorkout;
  bool get workoutInProgress => currentWorkout != null;
  WorkoutTimer timer = WorkoutTimer();

  WorkoutsState() {
    getWorkouts();
    timer.addListener(notifyListeners);
  }

  Future<void> getWorkouts() async {
    workouts = await RepositoryServiceWorkout.getAllWorkouts();
    notifyListeners();
  }

  Future<void> startWorkout(WorkoutType variation) async {
    currentWorkout = Workout(variation);
    final id = await RepositoryServiceWorkout.startWorkout(currentWorkout);
    currentWorkout.assignId(id);
    timer.start();

    getWorkouts();
    notifyListeners();
  }

  Future<void> endWorkout() async {
    currentWorkout.end();
    await RepositoryServiceWorkout.endWorkout(currentWorkout);
    currentWorkout = null;
    getWorkouts();
    notifyListeners();
    timer.reset();
  }
}
