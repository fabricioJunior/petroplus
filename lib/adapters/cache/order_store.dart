import '../../models/order_model.dart';
import '../../storages/hive_boxes.dart';
import '../../storages/store_adapter.dart';
import '../../storages/storage_entity.dart';
import '../../storages/store_base.dart';

class OrderStore extends StoreBase<OrderModel> {
  @override
  List<StoreAdapter<StorageEntity>> get adapters => [
    StoreAdapter<OrderModel>(OrderModel.fromStorage),
  ];

  @override
  String get hiveBoxName => HiveBoxNames.ordersBox;

  @override
  String key(OrderModel object) {
    return object.id;
  }
}
