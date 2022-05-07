import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petroplus/models/order.dart';
import 'package:petroplus/models/vehicle_model.dart';
import 'package:petroplus/repositories/orders_repository.dart';

part 'add_order_event.dart';
part 'add_order_state.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState> {
  final OrdersRepository ordersRepository;

  AddOrderBloc(this.ordersRepository) : super(AddOrderInitial()) {
    on<AddOrderCheckedOrderByLicensePlate>(
      _onGetVehicleByLicensePlate,
    );
  }

  FutureOr<void> _onGetVehicleByLicensePlate(
    AddOrderCheckedOrderByLicensePlate event,
    Emitter<AddOrderState> emit,
  ) async {
    try {
      VehicleModel? model = await ordersRepository.getVehicleByLicensePlate(event.licensePlate);
      await ordersRepository.saveOrder(model);
    } catch (e) {
      emit(AddOrderCheckOrderByLicensePlateErro());
    }
  }
}
