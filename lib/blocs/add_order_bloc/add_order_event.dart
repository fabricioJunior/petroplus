part of 'add_order_bloc.dart';

abstract class AddOrderEvent {}

class AddOrderStarted extends AddOrderEvent {}

class AddOrderCheckedOrderByLicensePlate extends AddOrderEvent {
  final String licensePlate;

  AddOrderCheckedOrderByLicensePlate(this.licensePlate);
}
