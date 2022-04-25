import 'package:bloc/bloc.dart';
import 'package:flutter_application_3/cubit/app_cubits.dart';
import 'package:flutter_application_3/services/DataModels.dart';
import 'package:flutter_application_3/services/data_services.dart';

class Appcubits extends Cubit<CubitStates> {
  Appcubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  void detailPage(DataModel info) {
    emit(DetailState(info));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
