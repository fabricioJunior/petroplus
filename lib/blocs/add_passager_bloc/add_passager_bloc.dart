import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/order_model.dart';

import '../../repositories/order_repository.dart';

part 'add_passager_event.dart';
part 'add_passager_state.dart';

class AddPassagerBloc extends Bloc<AddPassagerEvent, AddPassagerState> {
  final OrderRepository orderRepository;

  AddPassagerBloc(this.orderRepository) : super(AddPassagerInitial()) {
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
      await orderRepository.getAll();
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
      OrderModel? order = await orderRepository.getOrderByLicensePlate(event.licensePlate);
      emit(AddPassagerCheckOrderByLicensePlateSucess(order != null));
    } catch (e) {
      emit(AddPassagerCheckOrderByLicensePlateErro());
    }
  }
}
