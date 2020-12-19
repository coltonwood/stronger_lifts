import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stronger_lifts/models/app-state.dart';

class WorkoutWizardScreen extends StatelessWidget {
  WorkoutWizardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, appState, child) => Scaffold(
        appBar: AppBar(
          title: Text('BRAWNY'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.wb_sunny,
                  size: 26.0,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Text('colton'),
        ),
      ),
    );
  }
}
