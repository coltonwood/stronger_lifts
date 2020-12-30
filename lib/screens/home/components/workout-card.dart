import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stronger_lifts/models/workout.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;
  const WorkoutCard({Key key, this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        workout.typeStr,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
      title: Text(DateFormat('EEE, MMM dd').format(workout.endTime)),
      subtitle: Text(workout.duration),
      onTap: () => Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(workout.typeStr),
      )),
    );
  }
}
