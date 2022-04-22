import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/app_larger_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
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
            height: 40,
          ),
          // discover text
          Container(
              margin: const EdgeInsets.only(left: 10),
              child: AppLargeText(text: "Discover")),
          const SizedBox(
            height: 30,
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
                      color: Color.fromARGB(255, 74, 57, 208).withOpacity(0.7),
                      radius: 5),
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
            height: 300,
            width: double.infinity,
            child: TabBarView(controller: _tabcontroller, children: const [
              Text("hi"),
              Text("there"),
              Text("guys"),
            ]),
          ),
        ],
      ),
    );
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
