import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stronger_lifts/main.dart';
import 'package:stronger_lifts/models/timer.dart';
import 'package:stronger_lifts/models/workouts-state.dart';

final workoutTimerProvider = ChangeNotifierProvider<WorkoutTimer>((ref) {
  return WorkoutTimer();
});

class CurrentWorkoutScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    WorkoutsState woState = watch(workoutsStateProvider);
    WorkoutTimer workoutTimer = watch(workoutTimerProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => confirmEndWorkout(woState, workoutTimer, context),
            icon: Icon(Icons.stop),
          ),
        ],
        elevation: 0,
      ),
      backgroundColor: Colors.indigo,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            woState.currentWorkout?.type,
            style: TextStyle(
              color: Colors.indigoAccent,
              fontSize: 60,
              fontFeatures: [FontFeature.tabularFigures()],
            ),
          ),
          Center(
            child: Text(
              workoutTimer.currentDuration,
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void confirmEndWorkout(woState, workoutTimer, context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('End workout?'),
        actions: [
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
    ).then((exit) {
      if (!!exit) {
        woState.endWorkout();
        workoutTimer.reset();
        Navigator.of(context).pop();
      }
    });
  }
}
