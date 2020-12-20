import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeModel extends ChangeNotifier {
  ThemeData _theme;

  AppThemeModel() {
    _theme = initialTheme();
  }

  // getters
  ThemeData get themeData => _theme;

  // actions
  ThemeData initialTheme([Brightness br = Brightness.light]) {
    final isDarkMode = br == Brightness.dark;
    return ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.pinkAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: br,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: isDarkMode ? Colors.black : Colors.white,
          backgroundColor: Colors.pinkAccent,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: isDarkMode ? Colors.indigoAccent[100] : Colors.indigo,
          showUnselectedLabels: false,
        ));
  }

  void setBrightness(Brightness br) async {
    _theme = initialTheme(br);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', br == Brightness.dark);
  }
}
