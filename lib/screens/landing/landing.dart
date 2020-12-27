import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stronger_lifts/main.dart';
import 'package:stronger_lifts/models/app-state.dart';
import 'package:stronger_lifts/models/timer.dart';
import 'package:stronger_lifts/models/workouts-state.dart';
import 'package:stronger_lifts/screens/landing/components/continue-workout-button.dart';
import 'package:stronger_lifts/screens/current-workout/current-workout.dart';
import 'package:stronger_lifts/screens/landing/components/new-workout-button.dart';
import 'components/bottom-nav.dart';

class LandingScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AppState appState = watch(appStateProvider);
    WorkoutsState woState = watch(workoutsStateProvider);
    WorkoutTimer workoutTimer = watch(workoutTimerProvider);

    if (woState.workoutInProgress) {
      workoutTimer.start(woState.currentWorkout.startTime);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appState.appName),
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: appState.showWorkoutButton
          ? woState.workoutInProgress
              ? ContinueWorkoutButton()
              : NewWorkoutButton()
          : null,
      body: IndexedStack(
        children: appState.tabs.map((tab) => tab.navigator).toList(),
        index: appState.currentTabIndex,
      ),
    );
  }
}
