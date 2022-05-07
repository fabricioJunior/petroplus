import 'package:equatable/equatable.dart';
import 'package:petroplus/storages/storage_entity.dart';

class Order extends Equatable with StorageEntity {
  final DateTime createdAt;
  final DateTime updateAt;
  final int id;
  final String licensePlate;

  const Order(
    this.createdAt,
    this.updateAt,
    this.id,
    this.licensePlate,
  );

  Order.fromJson(Map<String, dynamic> json)
      : createdAt = DateTime.parse(json['created_at']),
        updateAt = DateTime.parse(json['update_at']),
        id = json['id'],
        licensePlate = json['licensePlate'];

  Order.fromStorage(Map<String, dynamic> props)
      : createdAt = props['createdAt'],
        updateAt = props['updatedAt'],
        id = props['id'],
        licensePlate = props['licensePlate'];

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
