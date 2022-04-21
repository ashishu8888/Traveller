import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/widgets/app_larger_text.dart';
import 'package:flutter_application_3/widgets/app_text.dart';
import 'package:flutter_application_3/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "lib/assets/images/a1.png",
    "lib/assets/images/b1.png",
    "lib/assets/images/c.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.fill,
                // alignment: Alignment.center,
              )),
              child: Stack(children: [
                Container(
                  margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(text: "Trips"),
                            AppText(
                              text: "Mountain",
                              size: 30,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 250,
                              child: AppText(
                                text:
                                    "Mountain hikes gives you an incredible sense of freedom along with endurance test",
                                colour: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ResponsiveButton(
                                //  widthW: 60,
                                ),
                          ],
                        ),
                        Column(
                          children: List.generate(images.length, (indexdots) {
                            return Container(
                              margin: EdgeInsets.all(1),
                              width: 8,
                              height: index == indexdots ? 25 : 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexdots
                                      ? Color.fromARGB(255, 74, 57, 208)
                                          .withOpacity(0.7)
                                      : Color.fromARGB(255, 74, 57, 208)
                                          .withOpacity(0.3)),
                            );
                          }),
                        )
                      ]),
                ),
              ]),
            );
          }),
    );
  }
}
