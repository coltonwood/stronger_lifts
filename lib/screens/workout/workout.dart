import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stronger_lifts/main.dart';
import 'package:stronger_lifts/models/app-state.dart';
import 'package:stronger_lifts/models/timer.dart';
import 'package:stronger_lifts/models/workouts-state.dart';

final workoutTimerProvider = ChangeNotifierProvider<WorkoutTimer>((ref) {
  return WorkoutTimer();
});

class WorkoutScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AppState appState = watch(appStateProvider);
    WorkoutsState workoutsState = watch(workoutsStateProvider);
    WorkoutTimer workoutTimer = watch(workoutTimerProvider);

    // workoutTimer.start();

    return Scaffold(
      appBar: AppBar(
        leading: new Container(),
        actions: [
          IconButton(
            onPressed: () => confirmExit(workoutsState, context),
            icon: Icon(Icons.close),
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Text(workoutTimer.currentDuration,
              style: TextStyle(
                fontSize: 60,
                fontFeatures: [FontFeature.tabularFigures()],
              )),
        ),
      ),
    );
  }

  void confirmExit(workoutsState, context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('End workout?'),
        actions: [
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.of(context).pop(false),
          )
        ],
      ),
    ).then((exit) {
      if (!!exit) {
        workoutsState.endWorkout();
        Navigator.of(context).pop();
      }
    });
  }
}
