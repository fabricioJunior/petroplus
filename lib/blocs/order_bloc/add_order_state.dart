part of 'add_order_bloc.dart';

abstract class AddOrderState {
  final List<MarkModel> marks;
  final List<Model> models;

  AddOrderState(this.marks, this.models);

  AddOrderState.empty()
      : marks = [],
        models = [];
}

class AddOrderInitial extends AddOrderState {
  AddOrderInitial() : super.empty();
}

class AddOrderLoadInProgress extends AddOrderState {
  AddOrderLoadInProgress() : super.empty();
}

class AddOrderLoadSucess extends AddOrderState {
  AddOrderLoadSucess(List<MarkModel> marks) : super(marks, []);
}

class AddOrderLoadError extends AddOrderState {
  AddOrderLoadError() : super.empty();
}

class AddOrderLoadModelsInProgress extends AddOrderState {
  AddOrderLoadModelsInProgress(List<MarkModel> marks) : super(marks, []);
}

class AddOrderLoadModelsInSucess extends AddOrderState {
  AddOrderLoadModelsInSucess(List<MarkModel> marks, List<Model> models)
      : super(marks, models);
}

class AddOrderLoadModelsFail extends AddOrderState {
  AddOrderLoadModelsFail(List<MarkModel> marks) : super(marks, []);
}
