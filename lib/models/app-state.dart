import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stronger_lifts/models/app-theme.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/router/router.dart' as router;

class AppState extends ChangeNotifier {
  int _currentTabIndex = 0;
  AppThemeModel _theme;
  List<MyTab> _tabs = [
    MyTab('Home', Icons.fitness_center, HomeTabRoute),
    MyTab('Stats', Icons.show_chart, StatsTabRoute),
    MyTab('Settings', Icons.settings, SettingsTabRoute),
  ];
  bool workoutInProgress = false;
  DateTime _workoutStartTime;

  // constructor
  AppState() {
    _theme = AppThemeModel();
    initBrightness();
    initWorkoutInProgress();
    notifyListeners();
  }

  // getters
  int get currentTabIndex => _currentTabIndex;
  MyTab get currentTab => _tabs[_currentTabIndex];
  Navigator get currentNavigator => _tabs[_currentTabIndex].navigator;
  List<MyTab> get tabs => _tabs;
  bool get showWorkoutButton => _currentTabIndex == 0;
  ThemeData get theme => _theme.themeData;
  DateTime get workoutStartTime => _workoutStartTime;

  // actions
  void initBrightness() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isDark = prefs.getBool('isDarkMode') ?? false;
    _theme.setBrightness(isDark ? Brightness.dark : Brightness.light);
    notifyListeners();
  }

  initWorkoutInProgress() async {
    final prefs = await SharedPreferences.getInstance();
    workoutInProgress = prefs.getBool('workoutInProgress') ?? false;
    notifyListeners();
  }

  void setCurrentTab(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  void toggleThemeBrightness() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isDark = prefs.getBool('isDarkMode') ?? false;
    _theme.setBrightness(isDark ? Brightness.light : Brightness.dark);
    notifyListeners();
  }

  Future<void> startWorkout() async {
    // create new workout in sqflite

    // start workout in local storage
    final now = DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    workoutInProgress = true;
    _workoutStartTime = now;
    prefs.setBool('workoutInProgress', true);
    prefs.setString('workoutStartTime', now.toString());
    notifyListeners();
  }

  Future<void> endWorkout() async {
    // update workout in sqflite

    // end workout in local storage
    final prefs = await SharedPreferences.getInstance();
    workoutInProgress = false;
    prefs.setBool('workoutInProgress', false);
    prefs.remove('_workoutStartTime');
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
