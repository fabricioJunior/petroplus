part of 'add_order_bloc.dart';

abstract class AddOrderEvent {}

class AddOrderStarted extends AddOrderEvent {}

class AddOrderSelectedMark extends AddOrderEvent {
  final MarkModel mark;

  AddOrderSelectedMark(this.mark);
}
