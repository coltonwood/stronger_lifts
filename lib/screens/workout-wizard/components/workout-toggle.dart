import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stronger_lifts/models/workout.dart';

class WorkoutToggle extends StatefulWidget {
  final WorkoutVariation variation;
  final Function toggle;
  WorkoutToggle({Key key, this.variation, this.toggle}) : super(key: key);

  @override
  _WorkoutToggleState createState() => _WorkoutToggleState();
}

class _WorkoutToggleState extends State<WorkoutToggle> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      children: <WorkoutVariation, Widget>{
        WorkoutVariation.a: Text('Workout A'),
        WorkoutVariation.b: Text('Workout B'),
      },
      groupValue: this.widget.variation,
      onValueChanged: this.widget.toggle,
    );
  }
}
