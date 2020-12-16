import 'package:stronger_lifts/components/custom-button.dart';
import 'package:flutter/material.dart';
import 'components/index.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'stronger_lifts',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.green[300],
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Carousel(),
                  CustomButton(text: 'Register'),
                ],
              ),
            ),
            BottomBanner(),
          ],
        ),
      ),
    );
  }
}
