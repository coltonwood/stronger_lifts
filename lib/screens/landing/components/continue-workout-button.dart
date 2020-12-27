import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stronger_lifts/models/timer.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/screens/current-workout/current-workout.dart';

class ContinueWorkoutButton extends ConsumerWidget {
  const ContinueWorkoutButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    WorkoutTimer workoutTimer = watch(workoutTimerProvider);

    return FloatingActionButton.extended(
      onPressed: () => Navigator.of(context).pushNamed(WorkoutRoute),
      label: Text(workoutTimer.currentDuration),
      icon: Icon(Icons.arrow_forward),
    );
  }
}
