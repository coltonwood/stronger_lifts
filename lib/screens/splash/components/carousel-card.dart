import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  CarouselCard({
    @required this.title,
    @required this.description,
  });
  final title, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      padding: EdgeInsets.only(bottom: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
