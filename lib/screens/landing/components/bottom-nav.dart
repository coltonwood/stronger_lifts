import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stronger_lifts/main.dart';
import 'package:stronger_lifts/models/app-state.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        AppState appState = watch(appStateProvider);

        return BottomNavigationBar(
          currentIndex: appState.currentTabIndex,
          onTap: appState.setCurrentTab,
          items: appState.tabs
              .map(
                (tab) => BottomNavigationBarItem(
                  icon: Icon(tab.icon),
                  label: tab.label,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
