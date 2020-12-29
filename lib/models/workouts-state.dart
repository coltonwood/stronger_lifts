import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stronger_lifts/models/timer.dart';
import 'package:stronger_lifts/models/workout.dart';
import 'package:stronger_lifts/repository/repository-service-workout.dart';

class WorkoutsState extends ChangeNotifier {
  List<Workout> workouts = List();
  List<Workout> get completeWorkouts => workouts.where((workout) => workout.endTime != null).toList();
  Workout currentWorkout;
  bool get workoutInProgress => currentWorkout != null;
  WorkoutTimer timer = WorkoutTimer();

  WorkoutsState() {
    getWorkouts();
    timer.addListener(notifyListeners);
  }

  Future<void> getWorkouts() async {
    workouts = await RepositoryServiceWorkout.getAllWorkouts();
    currentWorkout = workouts?.firstWhere(
      (workout) => workout.endTime == null,
      orElse: () => null,
    );
    if (currentWorkout != null)
      timer.start(currentWorkout.startTime);
    else
      timer.reset();
    notifyListeners();
  }

  Future<void> startWorkout(WorkoutType variation) async {
    currentWorkout = Workout(variation);
    await currentWorkout.initDone;
    timer.start();
    notifyListeners();
  }

  Future<void> endWorkout() async {
    await currentWorkout.end();
    await getWorkouts();
  }
}
