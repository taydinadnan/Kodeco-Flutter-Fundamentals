import 'package:bullseye/game_model.dart';
import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  const Control({super.key, required this.model});

  final GameModel model;

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 90.0),
          child: Text(
            '1',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Slider(
            value: widget.model.current.toDouble(),
            onChanged: (newValue) {
              setState(() {
                widget.model.current = newValue.toInt();
              });
            },
            max: 100.0,
            min: 1.0,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 90.0),
          child: Text(
            '100',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
