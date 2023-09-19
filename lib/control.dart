import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  const Control({super.key});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  var _currentValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('1'),
        ),
        Expanded(
          child: Slider(
            value: _currentValue,
            onChanged: (newValue) {
              setState(() {
                _currentValue = newValue;
                print(_currentValue);
              });
            },
            max: 100.0,
            min: 1.0,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('100'),
        ),
      ],
    );
  }
}
