import 'package:flutter/material.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/router/router.dart' as router;

class AppStateModel extends ChangeNotifier {
  int _currentTabIndex = 0;
  List<MyTab> _tabs = [
    MyTab(
      'Home',
      Icons.fitness_center,
      HomeTabRoute,
    ),
    MyTab(
      'Stats',
      Icons.show_chart,
      StatsTabRoute,
    ),
    MyTab(
      'Settings',
      Icons.settings,
      SettingsTabRoute,
    ),
  ];

  // getters
  int get currentTabIndex => _currentTabIndex;
  MyTab get currentTab => _tabs[_currentTabIndex];
  Navigator get currentNavigator => _tabs[_currentTabIndex].navigator;
  List<MyTab> get tabs => _tabs;
  bool get showWorkoutButton => _currentTabIndex == 0;

  // actions
  void setCurrentTab(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }
}

class MyTab {
  String _label;
  IconData _icon;
  String _initialRoute;
  Navigator _navigator;

  MyTab(String label, IconData icon, String initialRoute) {
    this._label = label;
    this._icon = icon;
    this._initialRoute = initialRoute;
    this._navigator = Navigator(
      key: UniqueKey(),
      initialRoute: initialRoute,
      onGenerateRoute: router.generateRoute,
    );
  }

  String get label => _label;
  String get initialRoute => _initialRoute;
  IconData get icon => _icon;
  Navigator get navigator => _navigator;
}
