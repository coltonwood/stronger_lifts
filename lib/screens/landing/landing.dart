import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stronger_lifts/models/app-state.dart';
import 'package:stronger_lifts/models/app-theme.dart';
import 'package:stronger_lifts/models/workout.dart';
import 'components/bottom-nav.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key key}) : super(key: key);

  void _goToWorkoutWizard() {
    print('starting workout');
    Workout(WorkoutVariation.a);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppStateModel>(
      create: (context) => AppStateModel(),
      child: Consumer<AppStateModel>(
        builder: (context, appState, child) => Scaffold(
          appBar: AppBar(
            title: Text('BRAWNY'),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: Provider.of<AppThemeModel>(context, listen: false).toggleThemeBrightness,
                  child: Icon(
                    Icons.wb_sunny,
                    size: 26.0,
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNav(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: appState.showWorkoutButton
              ? FloatingActionButton.extended(
                  onPressed: _goToWorkoutWizard,
                  label: Text('New workout'),
                  icon: Icon(Icons.add),
                )
              : null,
          body: IndexedStack(
            children: appState.tabs.map((tab) => tab.navigator).toList(),
            index: appState.currentTabIndex,
          ),
        ),
      ),
    );
  }
}
