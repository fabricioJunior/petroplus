import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petroplus/models/services.dart';
import 'package:petroplus/repositories/services_repository.dart';

import '../../models/product_model.dart';
import '../../repositories/product_repository.dart';
part 'finalize_budget_event.dart';

part 'finalize_budget_state.dart';

class FinalizeBudgetBloc extends Bloc<FinalizeBugetEvent, FinalizeBugetState> {
  final ProductRepository recommedationsRepository;
  final ServicesRepository servicesRepository;

  FinalizeBudgetBloc(
    this.recommedationsRepository,
    this.servicesRepository,
  ) : super(FinalizeBugetInitial()) {
    on<FinalizeBugetStarted>(_onFinalizeBugetStarted);
  }

  FutureOr<void> _onFinalizeBugetStarted(
    FinalizeBugetStarted event,
    Emitter<FinalizeBugetState> emit,
  ) async {
    emit(FinalizeBugetLoadInProgresso());
    try {
      var recommedations = await recommedationsRepository.getRecommended();
      var services = await servicesRepository.services();
      emit(FinalizeBugetLoadSucess(recommedations, services));
    } catch (e) {
      emit(FinalizeBugetLoadError());
    }
  }
}
