import 'package:flutter/material.dart';
import 'package:flutter_application_3/cubit/app_cubit_state.dart';
import 'package:flutter_application_3/cubit/app_cubits.dart';
import 'package:flutter_application_3/pages/welcomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/detailed_page.dart';
import '../pages/naviPage/home_page.dart';
import '../pages/naviPage/main_page.dart';

class AppCubitLogicState extends StatefulWidget {
  const AppCubitLogicState({Key? key}) : super(key: key);

  @override
  State<AppCubitLogicState> createState() => _AppCubitLogicStateState();
}

class _AppCubitLogicStateState extends State<AppCubitLogicState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<Appcubits, CubitStates>(builder: (context, state) {
      if (state is WelcomeState) return const WelcomePage();
      if (state is DetailState) return const DetailPage();
      if (state is LoadedState) return const MainPage();
      if (state is LoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Container();
      }
    }));
  }
}
