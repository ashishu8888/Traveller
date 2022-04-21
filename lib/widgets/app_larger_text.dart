import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color colour;

  // ignore: use_key_in_widget_constructors
  AppLargeText(
      {this.size = 30, required this.text, this.colour = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: colour, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
