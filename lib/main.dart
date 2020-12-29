import 'package:flutter_riverpod/all.dart';
import 'package:stronger_lifts/models/app-state.dart';
import 'package:stronger_lifts/models/workouts-state.dart';
import 'package:stronger_lifts/repository/database-creator.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/router/router.dart' as router;
import 'package:flutter/material.dart';

final appStateProvider = ChangeNotifierProvider<AppState>((ref) => AppState());
final workoutsStateProvider = ChangeNotifierProvider<WorkoutsState>((ref) => WorkoutsState());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();
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
