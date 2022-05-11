part of 'add_passager_bloc.dart';

abstract class AddPassagerEvent {}

class AddPassagerStarted extends AddPassagerEvent {}

class AddPassagerCheckedOrderByLicensePlate extends AddPassagerEvent {
  final String licensePlate;

  AddPassagerCheckedOrderByLicensePlate(this.licensePlate);
}
