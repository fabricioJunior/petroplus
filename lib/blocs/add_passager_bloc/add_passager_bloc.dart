import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petroplus/models/order.dart';
import 'package:petroplus/repositories/orders_repository.dart';

part 'add_passager_event.dart';
part 'add_passager_state.dart';

class AddPassagerBloc extends Bloc<AddPassagerEvent, AddPassagerState> {
  final OrdersRepository ordersRepository;

  AddPassagerBloc(this.ordersRepository) : super(AddPassagerInitial()) {
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
      await ordersRepository.sincronizar();
      emit(AddPassagerLoadSucess());
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
      Order? order =
          await ordersRepository.orderByLincesePlate(event.licensePlate);
      emit(AddPassagerCheckOrderByLicensePlateSucess(order != null));
    } catch (e) {
      emit(AddPassagerCheckOrderByLicensePlateErro());
    }
  }
}
