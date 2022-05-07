import 'package:equatable/equatable.dart';

class Order extends Equatable {
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

  @override
  List<Object?> get props => [
        createdAt,
        updateAt,
        id,
        licensePlate,
      ];
}
