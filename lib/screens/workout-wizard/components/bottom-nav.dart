import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stronger_lifts/models/app-state.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, appState, child) => BottomNavigationBar(
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
      ),
    );
  }
}
