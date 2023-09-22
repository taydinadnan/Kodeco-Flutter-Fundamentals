import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton(
      {super.key, required this.icon, required this.onPressed, this.text});

  final IconData icon;
  final String? text;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawMaterialButton(
          fillColor: Colors.black,
          splashColor: Colors.redAccent,
          onPressed: onPressed,
          shape: const CircleBorder(
              side: BorderSide(
            color: Colors.white,
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        text == null ? Text(" ") : Text("$text")
      ],
    );
  }
}
