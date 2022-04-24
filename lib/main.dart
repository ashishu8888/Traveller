import 'package:flutter/material.dart';
import 'package:flutter_application_3/cubit/app_cubit_logic.dart';
import 'package:flutter_application_3/cubit/app_cubit_state.dart';
import 'package:flutter_application_3/pages/detailed_page.dart';
import 'package:flutter_application_3/pages/naviPage/main_page.dart';
import 'package:flutter_application_3/pages/welcomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      home: BlocProvider<Appcubits>(
        create: (context) => Appcubits(),
        child: const AppCubitLogicState(),
      ),
    );
  }
}
