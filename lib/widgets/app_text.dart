import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color colour;

  // ignore: use_key_in_widget_constructors
  AppText({this.size = 16, required this.text, this.colour = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colour,
        fontSize: size,
      ),
    );
  }
}
