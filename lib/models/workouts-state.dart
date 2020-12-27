import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stronger_lifts/models/workout.dart';

class WorkoutsState extends ChangeNotifier {
  Workout _currentWorkout;
  Workout get currentWorkout => _currentWorkout;
  bool get workoutInProgress => currentWorkout != null;

  WorkoutsState() {
    init();
  }

  // setup values from local storage
  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final currentWorkoutPref = prefs.getString('currentWorkout');
    if (currentWorkoutPref != null) {
      final workoutJson = json.decode(prefs.getString('currentWorkout') ?? '{}');
      _currentWorkout = Workout.fromJson(workoutJson);
    }
    notifyListeners();
  }

  Future<void> startWorkout(WorkoutType variation) async {
    final prefs = await SharedPreferences.getInstance();
    _currentWorkout = Workout(variation);
    final currentWorkoutJson = _currentWorkout.toJson();
    await prefs.setString('currentWorkout', json.encode(currentWorkoutJson));

    notifyListeners();
  }

  Future<void> endWorkout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('currentWorkout');
    _currentWorkout = null;

    notifyListeners();
  }
}
