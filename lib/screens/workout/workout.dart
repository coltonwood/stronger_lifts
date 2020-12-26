import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stronger_lifts/main.dart';
import 'package:stronger_lifts/models/app-state.dart';
import 'package:stronger_lifts/models/timer.dart';

final workoutTimerProvider = ChangeNotifierProvider<WorkoutTimer>((ref) {
  return WorkoutTimer();
});

class WorkoutScreen extends StatefulWidget {
  WorkoutScreen({Key key}) : super(key: key);

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  void startTimer(AppState appState, WorkoutTimer timer) async {
    final prefs = await SharedPreferences.getInstance();
    DateTime startTime = DateTime.parse(prefs.getString('workoutStartTime'));
    timer.start(startTime);
  }

  void confirmExit(appState) {
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
        appState.endWorkout();
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        AppState appState = watch(appStateProvider);
        WorkoutTimer workoutTimer = watch(workoutTimerProvider);

        startTimer(appState, workoutTimer);

        return Scaffold(
          appBar: AppBar(
            leading: new Container(),
            actions: [
              IconButton(
                onPressed: () => confirmExit(appState),
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
      },
    );
  }
}
