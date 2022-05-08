import 'package:equatable/equatable.dart';
import '../storages/storage_entity.dart';

// ignore: must_be_immutable
class OrderModel extends Equatable with StorageEntity {
  final DateTime createdAt;
  final DateTime updateAt;
  final String id;
  final String licensePlate;
  List<OrderModel>? orders;

  OrderModel(
    this.createdAt,
    this.updateAt,
    this.id,
    this.licensePlate,
    this.orders,
  );

  OrderModel.fromJson(Map<String, dynamic> json)
    : createdAt = DateTime.parse(json['created_at']),
      updateAt = DateTime.parse(json['updated_at']),
      id = json['id'],
      licensePlate = json['license_plate'] ?? '';

  OrderModel.fromStorage(Map<String, dynamic> props)
    : createdAt = props['createdAt'],
      updateAt = props['updatedAt'],
      id = props['id'],
      licensePlate = props['licensePlate'];

  List<OrderModel>? mapOrders(Map<String, dynamic> json) {
    orders =  json['items'].map<OrderModel>((e) => OrderModel.fromJson(e)).toList();
    return orders;
  }

  OrderModel? getByLiscencePlate(String licensePlate) {
    var busca = orders!.where((order) => order.licensePlate == licensePlate);
    if (busca.isNotEmpty) {
      return busca.first;
    }
    return null;
  }

  @override
  List<Object?> get props => [
    createdAt,
    updateAt,
    id,
    licensePlate,
  ];

  @override
  Map<String, dynamic> get storageProperties => {
    'createdAt': createdAt,
    'updateAt': updateAt,
    'id': id,
    'licensePlate': licensePlate,
  };
}
