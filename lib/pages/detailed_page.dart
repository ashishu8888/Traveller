import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/Botton.dart';
import 'package:flutter_application_3/widgets/app_larger_text.dart';
import 'package:flutter_application_3/widgets/app_text.dart';
import 'package:flutter_application_3/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("lib/assets/images/mountain.jpeg"))),
              ),
            ),
            Positioned(
                left: 10,
                top: 39,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    )
                  ],
                )),
            Positioned(
                top: 250,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: "Nepal",
                            size: 20,
                            colour: Colors.black.withOpacity(0.7),
                          ),
                          AppLargeText(
                            text: "₹ 54K",
                            size: 15,
                            colour: Color.fromARGB(255, 74, 57, 208)
                                .withOpacity(0.7),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 74, 57, 208)
                                .withOpacity(0.7),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: "Ajmer, Rajasthan",
                            size: 14,
                            colour: Color.fromARGB(255, 74, 57, 208)
                                .withOpacity(0.7),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return const Icon(Icons.star,
                                  color: Color.fromARGB(255, 244, 220, 3));
                            }),
                          ),
                          AppText(text: "(5.0)")
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          AppLargeText(
                            text: "People",
                            size: 18,
                            colour: Colors.black.withOpacity(0.7),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          AppText(
                            text: "Number of People in your Group",
                            colour: Colors.black54,
                            size: 15,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        runAlignment: WrapAlignment.start,
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: Button(
                                  text: (index + 1).toString(),
                                  size: 50,
                                  color: index == selectedIndex
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: index == selectedIndex
                                      ? Colors.black
                                      : const Color.fromARGB(255, 74, 57, 208)
                                          .withOpacity(0.1),
                                  bordercolor:
                                      const Color.fromARGB(255, 74, 57, 208)
                                          .withOpacity(0.1)),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 20,
                        alignment: Alignment.topLeft,
                        child: AppLargeText(
                          text: "Description",
                          size: 16,
                          colour: Colors.black.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: AppText(
                            text:
                                "this is Awsome. this is Great. this is love. this is nice.",
                            size: 13,
                          ))
                    ],
                  ),
                )),
            Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: Container(
                  // margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                          icon: Icons.favorite_border_outlined,
                          isIcon: true,
                          size: 50,
                          color: Colors.white,
                          backgroundColor: Colors.white,
                          bordercolor: Colors.black54),
                      SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResposive: true,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
