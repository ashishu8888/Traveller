import 'package:flutter/material.dart';
import 'package:flutter_application_3/cubit/app_cubit_state.dart';
import 'package:flutter_application_3/cubit/app_cubits.dart';
import 'package:flutter_application_3/widgets/Botton.dart';
import 'package:flutter_application_3/widgets/app_larger_text.dart';
import 'package:flutter_application_3/widgets/app_text.dart';
import 'package:flutter_application_3/widgets/responsive_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  int gottenStar = 4;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Appcubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "http://mark.bslmeiyu.com/uploads/" +
                                    detail.place.img))),
                  ),
                ),
                Positioned(
                    left: 10,
                    top: 39,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<Appcubits>(context).goHome();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ))
                      ],
                    )),
                Positioned(
                    top: 250,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                text: detail.place.name,
                                size: 20,
                                colour: Colors.black.withOpacity(0.7),
                              ),
                              AppLargeText(
                                text: '₹ ' +
                                    '${(detail.place.price.toString())}k',
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
                                text: (detail.place.location),
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
                                  gottenStar = detail.place.stars;
                                  return Icon(Icons.star,
                                      color: index < gottenStar
                                          ? Color.fromARGB(255, 244, 220, 3)
                                          : Colors.black54);
                                }),
                              ),
                              AppText(
                                  text: ' ' +
                                      ((detail.place.stars).toDouble())
                                          .toString())
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
                                          : const Color.fromARGB(
                                                  255, 74, 57, 208)
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
                                text: detail.place.description,
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
        ;
      },
    );
  }
}
