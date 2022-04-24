import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResposive;
  // double widthW;

  // ignore: use_key_in_widget_constructors
  ResponsiveButton({
    this.isResposive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        //  width: widthW,
        //height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 74, 57, 208).withOpacity(0.8)),
        child: Row(
          mainAxisAlignment: isResposive == false
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            isResposive == true
                ? Container(
                    margin: EdgeInsets.only(left: 10),
                    child: AppText(
                      text: "Book Trip Now",
                      colour: Colors.white,
                    ),
                  )
                : AppText(text: ""),
            ClipRRect(
              child: Image.asset("lib/assets/images/button-one.png"),
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
      ),
    );
  }
}
