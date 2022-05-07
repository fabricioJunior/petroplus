import 'package:petroplus/models/order.dart';
import 'package:petroplus/storages/hive_boxes.dart';
import 'package:petroplus/storages/store_adapter.dart';
import 'package:petroplus/storages/storage_entity.dart';
import 'package:petroplus/storages/store_base.dart';

class OrdersStore extends StoreBase<Order> {
  @override
  List<StoreAdapter<StorageEntity>> get adapters => [
        StoreAdapter<Order>(Order.fromStorage),
      ];

  @override
  String get hiveBoxName => HiveBoxNames.ordersBox;

  @override
  int key(Order object) {
    return object.id;
  }
}
