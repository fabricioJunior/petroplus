import '../../models/order_model.dart';
import '../adapters/cache/hive/hive_boxes.dart';
import '../adapters/cache/hive/storage_entity.dart';
import '../adapters/cache/hive/store_adapter.dart';
import '../adapters/cache/hive/store_base.dart';

class OrderStore extends StoreBase<OrderModel> {
  @override
  List<StoreAdapter<StorageEntity>> get adapters => [
        StoreAdapter<OrderModel>(OrderModel.fromStorage),
      ];

  @override
  String get hiveBoxName => HiveBoxNames.ordersBox;

  @override
  String? key(OrderModel object) {
    return object.vehicleColor;
  }
}
