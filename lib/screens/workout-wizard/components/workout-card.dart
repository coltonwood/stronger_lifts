import 'package:flutter/material.dart';
import 'package:stronger_lifts/components/number-picker.dart';
import 'package:stronger_lifts/models/workout.dart';

class WorkoutCard extends StatefulWidget {
  final WorkoutVariation variation;
  WorkoutCard({Key key, this.variation}) : super(key: key);

  @override
  _WorkoutCardState createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  Map<WorkoutVariation, List<String>> exercises = {
    WorkoutVariation.a: ['Squat', 'Bench', 'Barbell Rows'],
    WorkoutVariation.b: ['Squat', 'Overhead Press', 'Deadlift'],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: exercises[this.widget.variation]
                .map(
                  (exercise) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(exercise),
                      NumberPicker(min: 45),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
