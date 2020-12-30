import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stronger_lifts/main.dart';
import 'package:stronger_lifts/models/workouts-state.dart';
import 'package:stronger_lifts/screens/home/components/workout-card.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    WorkoutsState woState = watch(workoutsStateProvider);

    return ListView.separated(
        itemCount: woState.completeWorkouts.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) =>
            WorkoutCard(workout: woState.completeWorkouts[index]));
  }
}
