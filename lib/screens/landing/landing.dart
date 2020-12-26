import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stronger_lifts/main.dart';
import 'package:stronger_lifts/models/app-state.dart';
import 'package:stronger_lifts/models/workouts-state.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/screens/workout-wizard/workout-wizard.dart';
import 'components/bottom-nav.dart';

class LandingScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AppState appState = watch(appStateProvider);
    WorkoutsState workoutsState = watch(workoutsStateProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appState.appName),
        actions: <Widget>[
          FlatButton(
            onPressed: appState.toggleThemeBrightness,
            child: Icon(Icons.wb_sunny, color: Colors.white),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: appState.showWorkoutButton
          ? FloatingActionButton.extended(
              onPressed: () {
                if (workoutsState.workoutInProgress) {
                  Navigator.of(context).pushNamed(WorkoutRoute);
                } else {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => WorkoutWizardScreen(),
                  );
                }
              },
              label: Text(workoutsState.workoutInProgress ? 'In progress' : 'New workout'),
              icon: Icon(workoutsState.workoutInProgress ? Icons.arrow_forward_ios : Icons.add),
            )
          : null,
      body: IndexedStack(
        children: appState.tabs.map((tab) => tab.navigator).toList(),
        index: appState.currentTabIndex,
      ),
    );
  }

  Future<void> checkForWorkoutInProgress(context) async {
    final prefs = await SharedPreferences.getInstance();
    bool workoutInProgress = prefs.getBool('workoutInProgress') ?? false;
    if (workoutInProgress) {
      Navigator.of(context).pushNamed(WorkoutRoute);
    }
  }
}
