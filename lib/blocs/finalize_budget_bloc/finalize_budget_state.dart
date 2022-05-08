part of 'finalize_budget_bloc.dart';

abstract class FinalizeBugetState {}

class FinalizeBugetInitial extends FinalizeBugetState {}

class FinalizeBugetLoadInProgresso extends FinalizeBugetState {}

class FinalizeBugetLoadSucess extends FinalizeBugetState {
  final Produtcs recommedations;
  final Services services;

  FinalizeBugetLoadSucess(
    this.recommedations,
    this.services,
  );
}

class FinalizeBugetLoadError extends FinalizeBugetState {}
