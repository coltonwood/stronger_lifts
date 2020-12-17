import 'package:flutter/material.dart';
import 'package:stronger_lifts/theme/style.dart';

class AppThemeModel extends ChangeNotifier {
  ThemeData _theme = ThemeData(
    primarySwatch: Colors.indigo,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
  );

  // getters
  ThemeData get theme => _theme;

  // actions
  void toggleThemeBrightness() {
    _theme = ThemeData(
      primarySwatch: Colors.indigo,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: _theme.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
    );
    notifyListeners();
  }
}
