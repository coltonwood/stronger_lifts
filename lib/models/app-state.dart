import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    initBrightness();
    notifyListeners();
  }

  // getters
  int get currentTabIndex => _currentTabIndex;
  MyTab get currentTab => _tabs[_currentTabIndex];
  Navigator get currentNavigator => _tabs[_currentTabIndex].navigator;
  List<MyTab> get tabs => _tabs;
  bool get showWorkoutButton => _currentTabIndex == 0;
  ThemeData get theme => _theme.themeData;

  // actions
  void initBrightness() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isDark = prefs.getBool('isDarkMode') ?? false;
    _theme.setBrightness(isDark ? Brightness.dark : Brightness.light);
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
}

class MyTab {
  String label;
  IconData icon;
  String initialRoute;
  Navigator navigator;

  MyTab(String label, IconData icon, String initialRoute) {
    this.label = label;
    this.icon = icon;
    this.initialRoute = initialRoute;
    this.navigator = Navigator(
      key: UniqueKey(),
      initialRoute: initialRoute,
      onGenerateRoute: router.generateRoute,
    );
  }
}
