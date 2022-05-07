import 'package:petroplus/pages/dashboard_page/controles/todo_model.dart';

abstract class StateTodo {}

class StateTodoStart implements StateTodo {}

class StateTodoLoading implements StateTodo {}

class StateTodoSuccess implements StateTodo {
  final List<TodoModel> todoSuccess;

  StateTodoSuccess(this.todoSuccess);
}

class StateTodoError implements StateTodo {
  final String todoError;

  StateTodoError(this.todoError);
}

// padrão state