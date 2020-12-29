import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stronger_lifts/main.dart';
import 'package:stronger_lifts/models/workouts-state.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ContinueWorkoutButton extends ConsumerWidget {
  const ContinueWorkoutButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    WorkoutsState woState = watch(workoutsStateProvider);

    return FloatingActionButton.extended(
      onPressed: () => Navigator.of(context).pushNamed(WorkoutRoute),
      label: Text(
        woState.timer.currentDuration,
        style: GoogleFonts.robotoMono(),
      ),
      icon: Icon(Icons.arrow_forward),
    );
  }
}
