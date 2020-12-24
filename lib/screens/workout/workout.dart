import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stronger_lifts/models/app-state.dart';
import 'package:stronger_lifts/models/timer.dart';

class WorkoutScreen extends StatefulWidget {
  WorkoutScreen({Key key}) : super(key: key);

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  void startTimer(AppStateModel appState, WorkoutTimer timer) async {
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
    return ChangeNotifierProvider<WorkoutTimer>(
      create: (c) => WorkoutTimer(),
      child: Consumer2<AppStateModel, WorkoutTimer>(
        builder: (context, appState, workoutTimer, child) {
          startTimer(appState, workoutTimer);
          // workoutTimer.start(appState.workoutStartTime);
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
      ),
    );
  }
}
