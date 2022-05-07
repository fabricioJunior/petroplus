import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:petroplus/pages/dashboard_page/controles/state_todo.dart';
import 'package:petroplus/pages/dashboard_page/controles/todo_repository.dart';

class TodoControler extends ValueNotifier<StateTodo> {
  final TodoRepository todoRepository = TodoRepository();
  TodoControler() : super(StateTodoStart());
  getTodos() async {
    try {
      value = StateTodoLoading();
      final todos = await todoRepository.getTodos();
      value = StateTodoSuccess(todos);
    } on DioError catch (e) {
      value = StateTodoError("Erro inesperado!");
    }
  }
}
