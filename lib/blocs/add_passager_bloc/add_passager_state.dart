part of 'add_passager_bloc.dart';

abstract class AddPassagerState {}

class AddPassagerInitial extends AddPassagerState {}

class AddPassagerLoadInProgress extends AddPassagerState {}

class AddPassagerLoadSucess extends AddPassagerState {}

class AddPassagerLoadError extends AddPassagerState {}

class AddPassagerCheckOrderByLicensePlateInProgress extends AddPassagerState {}

class AddPassagerCheckOrderByLicensePlateSucess extends AddPassagerState {
  final bool containsOrder;

  AddPassagerCheckOrderByLicensePlateSucess(this.containsOrder);
}

class AddPassagerCheckOrderByLicensePlateErro extends AddPassagerState {}
