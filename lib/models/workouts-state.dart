import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stronger_lifts/models/workout.dart';

class WorkoutsState extends ChangeNotifier {
  Workout _currentWorkout;
  Workout get currentWorkout => _currentWorkout;
  bool get workoutInProgress => currentWorkout != null;

  WorkoutsState() {
    print('workoutsState');
    init();
    notifyListeners();
  }

  // setup values from local storage
  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final workoutJson = json.decode(prefs.getString('currentWorkout') ?? '');
    print(workoutJson);
    _currentWorkout = Workout.fromJson(workoutJson);

    notifyListeners();
  }

  Future<void> startWorkout() async {
    final prefs = await SharedPreferences.getInstance();

    _currentWorkout = Workout();
    final currentWorkoutJson = _currentWorkout.toJson();
    prefs.setString('currentWorkout', json.encode(currentWorkoutJson));

    notifyListeners();
  }

  Future<void> endWorkout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('currentWorkout');
    _currentWorkout = null;

    notifyListeners();
  }
}
