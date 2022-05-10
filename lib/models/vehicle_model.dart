// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

VehicleModel vehicleModelFromJson(String str) =>
    VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

class VehicleModel {
  VehicleModel({
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

  dynamic customerId;
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
  String? chassisNumber;

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        customerId: json["customer_id"],
        customerVehicleId: json["customer_vehicle_id"],
        customerName: json["customer_name"],
        customerDocument: json["customer_document"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        vehicleMakerId: json["vehicle_maker_id"],
        vehicleModelId: json["vehicle_model_id"],
        vehicleYear: json["vehicle_year"],
        vehicleColor: json["vehicle_color"],
        clientId: json["client_id"],
        licensePlate: json["license_plate"],
        mileage: json["mileage"],
      );

  Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "customerVehicleId": customerVehicleId,
        "customerName": customerName,
        "customerDocument": customerDocument,
        "phoneNumber": phoneNumber,
        "email": email,
        "vehicleMakerId": vehicleMakerId,
        "vehicleModelId": vehicleModelId,
        "vehicleYear": vehicleYear,
        "vehicleColor": vehicleColor,
        "clientId": clientId,
        "licensePlate": licensePlate,
        "mileage": mileage,
      };

  Map<String, dynamic> toJsonPost() => {
        "customerId": '936be4b1-a1e6-43d2-a207-788e7f16fb34',
        "vehicleMakerId": vehicleMakerId,
        "vehicleModelId": vehicleModelId,
        "vehicleYear": '2021-1',
        "licensePlate": licensePlate,
        "mileage": mileage,
        "chassisNumber": chassisNumber,
        "clientId": clientId,
      };
}
