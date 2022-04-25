import 'package:equatable/equatable.dart';
import 'package:flutter_application_3/services/DataModels.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  // TODO: implement props
  List<Object?> get props => [places];
}

class detailState extends CubitStates {
  detailState(this.place);
  final List<DataModel> place;
  @override
  // TODO: implement props
  List<Object?> get props => [place];
}
