import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stronger_lifts/main.dart';
import 'package:stronger_lifts/models/workout.dart';
import 'package:stronger_lifts/router/routing_constants.dart';
import 'package:stronger_lifts/screens/workout-wizard/components/workout-card.dart';
import 'package:stronger_lifts/screens/workout-wizard/components/workout-toggle.dart';

class WorkoutWizardScreen extends StatefulWidget {
  WorkoutWizardScreen({Key key}) : super(key: key);

  @override
  _WorkoutWizardScreenState createState() => _WorkoutWizardScreenState();
}

class _WorkoutWizardScreenState extends State<WorkoutWizardScreen> {
  WorkoutVariation variation = WorkoutVariation.a;
  Map<WorkoutVariation, UniqueKey> keys = {
    WorkoutVariation.a: UniqueKey(),
    WorkoutVariation.b: UniqueKey(),
  };

  void toggleWorkout(WorkoutVariation wv) {
    setState(() {
      variation = wv;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: Navigator.of(context).pop,
            icon: Icon(Icons.close),
          ),
        ],
        leading: Container(),
        title: Text('Workout Options'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () async {
          await context.read(appStateProvider).startWorkout();
          Navigator.of(context).popAndPushNamed(WorkoutRoute);
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20),
            child: WorkoutToggle(variation: variation, toggle: toggleWorkout),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: WorkoutCard(key: keys[variation], variation: variation),
          ),
        ],
      ),
    );
  }
}
