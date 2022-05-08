import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../pages/dashboard_page/controles/x_order_state.dart';
import '../../repositories/order_repository.dart';

class XOrderController extends ValueNotifier<StateTodo> {
  
  final OrderRepository orderRepository;

  XOrderController(this.orderRepository) : super(StateTodoStart());
  
  Future<void> getTodos() async {
    try {
      value = StateTodoLoading();
      final todos = await orderRepository.getOrders();
      value = StateTodoSuccess(todos);
    } on DioError {
      value = StateTodoError("Erro inesperado!");
    }
  }
}
