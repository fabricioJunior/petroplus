import '../../models/x_order_model.dart';

abstract class StateTodo {}

class StateTodoStart implements StateTodo {}

class StateTodoLoading implements StateTodo {}

class StateTodoSuccess implements StateTodo {
  final List<XOrderModel> todoSuccess;

  StateTodoSuccess(this.todoSuccess);
}

class StateTodoError implements StateTodo {
  final String todoError;

  StateTodoError(this.todoError);
}