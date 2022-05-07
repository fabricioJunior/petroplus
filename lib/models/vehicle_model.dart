// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

VehicleModel vehicleModelFromJson(String str) => VehicleModel.fromJson(json.decode(str));

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
