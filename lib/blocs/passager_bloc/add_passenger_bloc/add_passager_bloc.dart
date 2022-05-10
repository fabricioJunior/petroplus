import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petroplus/models/order_model.dart';

import '../../../repositories/order_repository.dart';

part 'add_passager_event.dart';
part 'add_passager_state.dart';

class AddPassangerBloc extends Bloc<AddPassagerEvent, AddPassagerState> {
  final OrderRepository _repository;

  AddPassangerBloc(this._repository) : super(AddPassagerInitial()) {
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
      await _repository.getAll();
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
      OrderModel? order = await _repository.getByLicensePlate(event.licensePlate);
      emit(AddPassagerCheckOrderByLicensePlateSucess(order != null));
    } catch (e) {
      emit(AddPassagerCheckOrderByLicensePlateErro());
    }
  }
}
