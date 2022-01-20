import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

enum DishCounterSize { normal, min }

class DishCounter extends StatefulWidget {
  final void Function(int) onChanged;
  final DishCounterSize size;
  final int initialValue;
  DishCounter({
    required this.onChanged,
    this.size = DishCounterSize.normal,
    this.initialValue = 0,
  });
  @override
  State<DishCounter> createState() => _DishCounterState();
}

class _DishCounterState extends State<DishCounter> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  void _updateCounter(int counter) {
    _counter = counter;
    if (_counter < 0) _counter = 0;
    setState(() {});
    widget.onChanged(_counter);
  }

  @override
  Widget build(BuildContext context) {
    bool isMin = widget.size == DishCounterSize.min;
    final double padding = isMin ? 5 : 10;
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            onPressed: () => _updateCounter(_counter - 1),
            minSize: padding,
            color: primaryColor,
            padding: EdgeInsets.all(padding),
            borderRadius: BorderRadius.circular(30),
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          Text("$_counter", style: TextStyle(fontSize: 20)),
          SizedBox(width: 10),
          CupertinoButton(
            onPressed: () => _updateCounter(_counter + 1),
            color: primaryColor,
            minSize: padding,
            padding: EdgeInsets.all(padding),
            borderRadius: BorderRadius.circular(30),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
