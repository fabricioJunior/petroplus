import 'dart:convert';

import '../storages/storage_entity.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel extends StorageEntity {
  OrderModel({
    this.customerId,
    this.customerVehicleId,
    this.customerName,
    this.customerDocument,
    this.phoneNumber,
    this.email,
    this.vehicleMakerId,
    this.vehicleModelId,
    this.vehicleYear,
    this.vehicleColor,
    this.clientId,
    this.licensePlate,
    this.mileage,
  });

  dynamic? customerId;
  String? customerVehicleId;
  String? customerName;
  String? customerDocument;
  String? phoneNumber;
  String? email;
  int? vehicleMakerId;
  int? vehicleModelId;
  String? vehicleYear;
  String? vehicleColor;
  String? clientId;
  String? licensePlate;
  String? mileage;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        customerId: json["customerId"],
        customerVehicleId: json["customerVehicleId"],
        customerName: json["customerName"],
        customerDocument: json["customerDocument"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        vehicleMakerId: json["vehicleMakerId"],
        vehicleModelId: json["vehicleModelId"],
        vehicleYear: json["vehicleYear"],
        vehicleColor: json["vehicleColor"],
        clientId: json["clientId"],
        licensePlate: json["licensePlate"],
        mileage: json["mileage"],
      );

  OrderModel.fromStorage(Map<String, dynamic> props)
      : licensePlate = props['licensePlate'];

  Map<String, dynamic> toJson() => {
        "customerId": null,
        "customerVehicleId": "b6fa86c1-9fac-4098-966f-b21276c066c8",
        "customerName": customerName,
        "customerDocument": customerDocument,
        "phoneNumber": phoneNumber,
        "email": email,
        "vehicleMakerId": 2,
        "vehicleModelId": 2,
        "vehicleYear": vehicleYear,
        "vehicleColor": vehicleColor,
        "clientId": "936be4b1-a1e6-43d2-a207-788e7f16fb34",
        "licensePlate": licensePlate,
        "mileage": mileage,
      };

  @override
  Map<String, dynamic> get storageProperties => throw UnimplementedError();
}
