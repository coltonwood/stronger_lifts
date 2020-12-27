import 'package:flutter/material.dart';
import 'package:stronger_lifts/screens/workout-wizard/workout-wizard.dart';

class NewWorkoutButton extends StatelessWidget {
  const NewWorkoutButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context) => WorkoutWizardScreen(),
      ),
      label: Text('New workout'),
      icon: Icon(Icons.add),
    );
  }
}
