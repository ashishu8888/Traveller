import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/naviPage/home_page.dart';
import 'package:flutter_application_3/pages/naviPage/my_page.dart';
import 'package:flutter_application_3/pages/naviPage/search_page.dart';
import 'bar_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarPage(),
    const SearchPage(),
    const MyPage()
  ];
  int currentindex = 0;
  void ontap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      backgroundColor: Colors.white,
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: ontap,
          currentIndex: currentindex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 4,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "My", icon: Icon(Icons.person)),
          ]),
    );
  }
}
