import 'package:flutter/material.dart';
import 'package:stronger_lifts/models/app-theme.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/router/router.dart' as router;

class AppState extends ChangeNotifier {
  int _currentTabIndex = 0;
  AppThemeModel _theme;
  String appName = 'BRAWNY';
  List<MyTab> _tabs = [
    MyTab('Home', Icons.fitness_center, HomeTabRoute),
    MyTab('Stats', Icons.show_chart, StatsTabRoute),
    MyTab('Settings', Icons.settings, SettingsTabRoute),
  ];

  // constructor
  AppState() {
    _theme = AppThemeModel();
    notifyListeners();
  }

  // getters
  int get currentTabIndex => _currentTabIndex;
  MyTab get currentTab => _tabs[_currentTabIndex];
  Navigator get currentNavigator => _tabs[_currentTabIndex].navigator;
  List<MyTab> get tabs => _tabs;
  bool get showWorkoutButton => _currentTabIndex != 2;
  ThemeData get theme => _theme.themeData;

  // actions
  void setCurrentTab(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }
}

class MyTab {
  String label;
  IconData icon;
  String initialRoute;
  Navigator navigator;

  MyTab(this.label, this.icon, this.initialRoute)
      : navigator = Navigator(
          key: UniqueKey(),
          initialRoute: initialRoute,
          onGenerateRoute: router.generateRoute,
        );
}
