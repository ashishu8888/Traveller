import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResposive;
  // double widthW;

  // ignore: use_key_in_widget_constructors
  ResponsiveButton({
    this.isResposive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widthW,
      // height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.purple),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            child: Image.asset("lib/assets/images/button-one.png"),
            borderRadius: BorderRadius.circular(10),
          )
        ],
      ),
    );
  }
}
