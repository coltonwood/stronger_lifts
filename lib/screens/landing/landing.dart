import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stronger_lifts/models/app-state.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/screens/workout-wizard/workout-wizard.dart';
import 'components/bottom-nav.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, appState, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BRAWNY'),
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
                  // Navigator.of(context).pushNamed(WorkoutWizartRoute);
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => WorkoutWizardScreen(),
                  );
                },
                label: Text('New Workout'),
                icon: Icon(Icons.add),
              )
            : null,
        body: IndexedStack(
          children: appState.tabs.map((tab) => tab.navigator).toList(),
          index: appState.currentTabIndex,
        ),
      ),
    );
  }
}
