import 'package:equatable/equatable.dart';
import 'order_model.dart';

class OrdersListModel extends Equatable {
  final List<OrderModel> orders;

  const OrdersListModel(this.orders);

  OrdersListModel.fromJson(Map<String, dynamic> json)
      : orders = json['items']
            .map<OrderModel>((e) => OrderModel.fromJson(e))
            .toList();

  OrderModel? getByLiscencePlate(String licensePlate) {
    var busca = orders
        .where((order) =>
            order.licensePlate?.toLowerCase() == licensePlate.toLowerCase())
        .toList();
    if (busca.isNotEmpty) {
      return busca.first;
    }
    return null;
  }

  @override
  List<Object?> get props => [orders];
}
