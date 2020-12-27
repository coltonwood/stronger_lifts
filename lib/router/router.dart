import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/screens/home/home.dart';
import 'package:stronger_lifts/screens/landing/landing.dart';
import 'package:stronger_lifts/screens/settings/settings.dart';
import 'package:stronger_lifts/screens/stats/stats.dart';
import 'package:stronger_lifts/screens/undefined/undefined.dart';
import 'package:flutter/material.dart';
import 'package:stronger_lifts/screens/workout-wizard/workout-wizard.dart';
import 'package:stronger_lifts/screens/current-workout/current-workout.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LandingScreenRoute:
      return MaterialPageRoute(builder: (c) => clearHistory(LandingScreen()));
    case HomeTabRoute:
      return MaterialPageRoute(builder: (c) => clearHistory(HomeScreen()));
    case StatsTabRoute:
      return MaterialPageRoute(builder: (c) => clearHistory(StatsScreen()));
    case SettingsTabRoute:
      return MaterialPageRoute(builder: (c) => clearHistory(SettingsScreen()));
    case WorkoutWizartRoute:
      return MaterialPageRoute(builder: (c) => WorkoutWizardScreen());
    case WorkoutRoute:
      return MaterialPageRoute(builder: (c) => CurrentWorkoutScreen());
    default:
      return MaterialPageRoute(builder: (c) => UndefinedRouteScreen());
  }
}

// disables back navigation
Widget clearHistory(Widget widget) {
  return WillPopScope(
    child: widget,
    onWillPop: () async => false,
  );
}
