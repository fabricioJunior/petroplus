import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petroplus/models/mark_model.dart';
import 'package:petroplus/models/model_model.dart';
import 'package:petroplus/repositories/vehicle_repository.dart';
part 'add_order_state.dart';
part 'add_order_event.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState> {
  final VehicleRepository vehicleRepository;

  AddOrderBloc(this.vehicleRepository) : super(AddOrderInitial()) {
    on<AddOrderStarted>(_onAddOrderStarted);
    on<AddOrderSelectedMark>(_onAddOrderSelectedMark);
  }

  FutureOr<void> _onAddOrderStarted(
    AddOrderStarted event,
    Emitter<AddOrderState> emit,
  ) async {
    emit(AddOrderLoadInProgress());
    try {
      var marks = await vehicleRepository.getMakers();
      emit(AddOrderLoadSucess(marks));
    } catch (e) {
      emit(AddOrderLoadError());
    }
  }

  FutureOr<void> _onAddOrderSelectedMark(
    AddOrderSelectedMark event,
    Emitter<AddOrderState> emit,
  ) async {
    emit(AddOrderLoadModelsInProgress(state.marks));
    try {
      var models = await vehicleRepository.getModels(event.mark.id ?? 0);
      emit(AddOrderLoadModelsInSucess(state.marks, models));
    } catch (e) {
      emit(AddOrderLoadError());
    }
  }
}
