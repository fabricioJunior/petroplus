import 'package:petroplus/data_access/cache/orders_store.dart';
import 'package:petroplus/data_access/clients/orders_client.dart';
import 'package:petroplus/models/order.dart';
import 'package:petroplus/models/orders_list.dart';

class OrdersRepository {
  final OrdersClient ordersClient;
  final OrdersStore ordersStore;

  OrdersRepository(
    this.ordersClient,
    this.ordersStore,
  );

  Future<void> sincronizar() async {
    var orders = await ordersClient.getAll();
    await ordersStore.save(orders.orders);
  }

  Future<Order?> orderByLincesePlate(String licensePlate) async {
    List<Order> orders = await ordersStore.fetchAll();

    Order? result = OrdersList(orders).getByLiscencePlate(licensePlate);

    if (result != null) {
      return result;
    }

    return (await ordersClient.getAll()).getByLiscencePlate(licensePlate);
  }
}
