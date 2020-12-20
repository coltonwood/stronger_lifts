import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stronger_lifts/models/workout.dart';
import 'package:stronger_lifts/screens/workout-wizard/components/workout-toggle.dart';

class WorkoutWizardScreen extends StatefulWidget {
  WorkoutWizardScreen({Key key}) : super(key: key);

  @override
  _WorkoutWizardScreenState createState() => _WorkoutWizardScreenState();
}

class _WorkoutWizardScreenState extends State<WorkoutWizardScreen> {
  WorkoutVariation _variation = WorkoutVariation.a;

  void toggleWorkout(WorkoutVariation wv) {
    setState(() {
      _variation = wv;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(Icons.close),
        ),
        title: Text('Workout Options'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {},
        child: Icon(Icons.arrow_forward_ios),
      ),
      body: Center(
        child: WorkoutToggle(variation: _variation, toggle: toggleWorkout),
      ),
    );
  }
}
