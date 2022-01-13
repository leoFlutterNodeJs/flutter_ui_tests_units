import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

class DishCounter extends StatefulWidget {
  final void Function(int) onChanged;
  DishCounter({@required this.onChanged});
  @override
  State<DishCounter> createState() => _DishCounterState();
}

class _DishCounterState extends State<DishCounter> {
  int _counter = 0;

  void _updateCounter(int counter) {
    _counter = counter;
    if (_counter < 0) _counter = 0;
    setState(() {});
    widget.onChanged(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            onPressed: () => _updateCounter(_counter - 1),
            color: primaryColor,
            padding: EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(30),
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          Text("$_counter", style: TextStyle(fontSize: 20)),
          SizedBox(width: 10),
          CupertinoButton(
            onPressed: () => _updateCounter(_counter + 1),
            color: primaryColor,
            padding: EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(30),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
