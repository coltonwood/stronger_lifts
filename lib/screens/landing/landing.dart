import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stronger_lifts/models/app-state.dart';
import 'components/bottom-nav.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppStateModel>(
      create: (context) => AppStateModel(),
      child: Consumer<AppStateModel>(
        builder: (context, appState, child) => Scaffold(
          bottomNavigationBar: BottomNav(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: appState.showWorkoutButton
              ? FloatingActionButton.extended(
                  onPressed: () {},
                  label: Text('Start Workout'),
                  icon: Icon(Icons.fitness_center),
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
