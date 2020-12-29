import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stronger_lifts/main.dart';
import 'package:stronger_lifts/models/workouts-state.dart';

class CurrentWorkoutScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    WorkoutsState woState = watch(workoutsStateProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => confirmEndWorkout(woState, context),
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
            woState.currentWorkout?.typeStr ?? '',
            style: TextStyle(
              color: Colors.indigoAccent,
              fontSize: 60,
              fontFeatures: [FontFeature.tabularFigures()],
            ),
          ),
          Center(
            child: Text(
              woState.timer.currentDuration,
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                fontSize: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void confirmEndWorkout(woState, context) {
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
        Navigator.of(context).pop();
      }
    });
  }
}
