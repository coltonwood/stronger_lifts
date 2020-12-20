import 'package:provider/provider.dart';
import 'package:stronger_lifts/models/app-state.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/router/router.dart' as router;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppStateModel>(
      create: (context) => AppStateModel(),
      child: Consumer<AppStateModel>(
        builder: (context, appState, child) => MaterialApp(
          theme: appState.theme.themeData,
          onGenerateRoute: router.generateRoute,
          initialRoute: LandingScreenRoute,
        ),
      ),
    );
  }
}
