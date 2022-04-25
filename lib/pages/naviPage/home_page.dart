import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/cubit/app_cubit_state.dart';
import 'package:flutter_application_3/cubit/app_cubits.dart';
import 'package:flutter_application_3/widgets/app_larger_text.dart';
import 'package:flutter_application_3/widgets/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "lib/assets/images/balloning.png": 'Balloning',
    "lib/assets/images/kayaking.png": 'Kayaking',
    "lib/assets/images/hiking.png": 'Mountain',
    "lib/assets/images/snorkling.png": 'Snorkling'
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<Appcubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // discover text
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: AppLargeText(text: "Discover")),
              const SizedBox(
                height: 20,
              ),
              // tabBar
              // ignore: avoid_unnecessary_containers
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 12, right: 12),
                      controller: _tabcontroller,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTapIndicator(
                          color:
                              Color.fromARGB(255, 74, 57, 208).withOpacity(0.7),
                          radius: 3.5),
                      tabs: const [
                        Tab(
                          text: "Places",
                        ),
                        Tab(
                          text: "Inspiration",
                        ),
                        Tab(
                          text: "Emotions",
                        ),
                      ]),
                ),
              ),

              Container(
                height: 200,
                width: double.infinity,
                child: TabBarView(controller: _tabcontroller, children: [
                  // ListView Builder
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: info.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/" +
                                          info[index].img),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                        );
                      }),
                  Text('hi'),
                  Text('there'),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 12),
                child: Row(
                  children: [
                    AppLargeText(
                      text: "Explore More",
                      size: 18,
                    ),
                    Expanded(child: Container()),
                    AppText(
                      text: "See all",
                      size: 12,
                      colour: Color.fromARGB(255, 74, 57, 208).withOpacity(0.7),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 05,
              ),
              Container(
                  height: 90,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            right: 20,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            images.keys.elementAt(index)),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  size: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      }))
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTapIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTapIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _cirlepainter(color: color, radius: radius);
  }
}

class _cirlepainter extends BoxPainter {
  final Color color;
  double radius;
  _cirlepainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
