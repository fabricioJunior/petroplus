import 'package:petroplus/data_access/clients/orders_client.dart';
import 'package:petroplus/models/order.dart';

class OrdersRepository {
  final OrdersClient ordersClient;

  OrdersRepository(this.ordersClient);

  Future<Order?> orderByLincesePlate(String licensePlate) async {
    return (await ordersClient.getAll()).getByLiscencePlate(licensePlate);
  }
}
