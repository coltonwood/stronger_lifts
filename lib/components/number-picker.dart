import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  final int min;
  final int max;
  NumberPicker({Key key, this.min = 35, this.max = 1000}) : super(key: key);

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  int val = 45;
  bool bottomedOut = false;
  bool maxedOut = false;

  @override
  void initState() {
    super.initState();
    print('hmm');
    setState(() {
      bottomedOut = val <= this.widget.min;
      maxedOut = val >= this.widget.max;
    });
  }

  void _updateRange() {
    setState(() {
      maxedOut = val >= this.widget.max;
      bottomedOut = val <= this.widget.min;
    });
  }

  void _increment() {
    setState(() {
      val += 5;
      _updateRange();
    });
  }

  void _decrement() {
    setState(() {
      val -= 5;
      _updateRange();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            CupertinoButton(
              padding: EdgeInsets.all(0),
              onPressed: bottomedOut ? null : _decrement,
              child: Icon(Icons.remove, color: bottomedOut ? Colors.grey : Colors.black),
            ),
            Container(width: 50, alignment: Alignment.center, child: Text('$val')),
            CupertinoButton(
              padding: EdgeInsets.all(0),
              onPressed: _increment,
              child: Icon(Icons.add, color: maxedOut ? Colors.grey : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
