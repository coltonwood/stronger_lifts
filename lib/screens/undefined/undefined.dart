import 'package:flutter/material.dart';

class UndefinedRouteScreen extends StatelessWidget {
  final String name;
  const UndefinedRouteScreen({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Route for $name is not defined'),
            RaisedButton(
              child: Text('Go back'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
