import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.text,
    this.onPressed,
    this.color = Colors.green,
    this.elevation = 2,
  }) : super(key: key);
  final String text;
  final Function onPressed;
  final Color color;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: color,
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 40, right: 40),
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        onPressed: onPressed,
      ),
    );
  }
}
