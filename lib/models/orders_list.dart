import 'package:equatable/equatable.dart';
import 'package:petroplus/models/order.dart';

class OrdersList extends Equatable {
  final List<Order> orders;

  const OrdersList(this.orders);

  OrdersList.fromJson(Map<String, dynamic> json)
      : orders = json['items'].map<Order>((e) => Order.fromJson(e)).toList();

  Order? getByLiscencePlate(String licensePlate) {
    var busca = orders.where((order) => order.licensePlate == licensePlate);
    if (busca.isNotEmpty) {
      return busca.first;
    }
    return null;
  }

  @override
  List<Object?> get props => [orders];
}
