import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:intl/intl.dart';
import 'package:stronger_lifts/main.dart';
import 'package:stronger_lifts/models/workouts-state.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    WorkoutsState woState = watch(workoutsStateProvider);

    return ListView.separated(
      itemCount: woState.workouts.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text(
            woState.workouts[index].typeStr,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          title: Text(DateFormat('MMM d, yyyy @ h:mm a').format(woState.workouts[index].endTime)),
        );
      },
    );
  }
}
