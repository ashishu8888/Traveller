import 'package:bloc/bloc.dart';
import 'package:flutter_application_3/cubit/app_cubits.dart';

class Appcubits extends Cubit<CubitStates> {
  Appcubits() : super(InitialState()) {
    emit(WelcomeState());
  }
}
