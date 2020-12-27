import 'package:flutter_riverpod/all.dart';
import 'package:stronger_lifts/models/app-state.dart';
import 'package:stronger_lifts/models/timer.dart';
import 'package:stronger_lifts/models/workouts-state.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/router/router.dart' as router;
import 'package:flutter/material.dart';

final appStateProvider = ChangeNotifierProvider<AppState>((ref) => AppState());
final workoutsStateProvider = ChangeNotifierProvider<WorkoutsState>((ref) => WorkoutsState());
final timerProvider = ChangeNotifierProvider<WorkoutTimer>((ref) => WorkoutTimer());

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AppState appState = watch(appStateProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appState.theme,
      onGenerateRoute: router.generateRoute,
      initialRoute: LandingScreenRoute,
    );
  }
}
