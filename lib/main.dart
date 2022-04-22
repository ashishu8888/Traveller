import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/naviPage/main_page.dart';
import 'package:flutter_application_3/pages/welcomePage.dart';

import 'pages/naviPage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traveller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
