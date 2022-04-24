import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color bordercolor;
  String? text;
  IconData? icon;
  bool isIcon;
  Button(
      {Key? key,
      this.text = "hi",
      this.icon,
      this.isIcon = false,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.bordercolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: bordercolor, width: 1.0),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor),
      child: isIcon == true
          ? Center(
              child: Icon(
              icon,
              color: Colors.black54,
              size: 20,
            ))
          : Center(
              child: Text(
              text!,
              style: TextStyle(fontSize: 16, color: color),
            )),
    );
  }
}
