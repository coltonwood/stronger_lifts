import 'package:provider/provider.dart';
import 'package:stronger_lifts/models/app-theme.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/router/router.dart' as router;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppThemeModel>(
      create: (context) => AppThemeModel(),
      child: Consumer<AppThemeModel>(
        builder: (context, appTheme, child) => MaterialApp(
          theme: appTheme.theme,
          onGenerateRoute: router.generateRoute,
          initialRoute: LandingScreenRoute,
        ),
      ),
    );
  }
}
