import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/theme/style.dart';
import 'package:stronger_lifts/router/router.dart' as router;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      onGenerateRoute: router.generateRoute,
      initialRoute: LandingScreenRoute,
    );
  }
}
