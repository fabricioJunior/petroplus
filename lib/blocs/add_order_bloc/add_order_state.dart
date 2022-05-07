part of 'add_order_bloc.dart';

abstract class AddOrderState {}

class AddOrderInitial extends AddOrderState {}

class AddOrderLoadInProgress extends AddOrderState {}

class AddOrderLoadSucess extends AddOrderState {}

class AddOrderLoadError extends AddOrderState {}


class AddOrderCheckOrderByLicensePlateSucess extends AddOrderState {
  final bool containsOrder;

  AddOrderCheckOrderByLicensePlateSucess(this.containsOrder);
}

class AddOrderCheckOrderByLicensePlateErro extends AddOrderState {}
