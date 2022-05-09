import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petroplus/models/order_model.dart';

import '../../models/customers.dart';
import '../../repositories/customers_repository.dart';
import '../../repositories/order_repository.dart';

part 'add_passager_event.dart';
part 'add_passager_state.dart';

class AddPassangerBloc extends Bloc<AddPassagerEvent, AddPassagerState> {
  final OrderRepository orderRepository;
  final CustomersRepository customersRepository;

  AddPassangerBloc(this.orderRepository, this.customersRepository)
      : super(AddPassagerInitial()) {
    on<AddPassagerStarted>(_onAddPassagerStarted);
    on<AddPassagerCheckedOrderByLicensePlate>(
      _onAddPassagerCheckedOrderByLicensePlate,
    );
  }

  FutureOr<void> _onAddPassagerStarted(
    AddPassagerStarted event,
    Emitter<AddPassagerState> emit,
  ) async {
    emit(AddPassagerLoadInProgress());
    try {
      var customers = await customersRepository.customers();
      emit(AddPassagerLoadSucess(customers));
    } catch (e) {
      emit(AddPassagerLoadError());
    }
  }

  FutureOr<void> _onAddPassagerCheckedOrderByLicensePlate(
    AddPassagerCheckedOrderByLicensePlate event,
    Emitter<AddPassagerState> emit,
  ) async {
    emit(AddPassagerCheckOrderByLicensePlateInProgress());
    try {
      OrderModel? order =
          await orderRepository.getOrderByLicensePlate(event.licensePlate);
      emit(AddPassagerCheckOrderByLicensePlateSucess(order != null));
    } catch (e) {
      emit(AddPassagerCheckOrderByLicensePlateErro());
    }
  }
}
