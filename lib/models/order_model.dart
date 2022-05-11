// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

OrderModel vehicleModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String vehicleModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    OrderModel({
        this.createdAt,
        this.updatedAt,
        this.id,
        this.number,
        this.mileage,
        this.vehicleMakerId,
        this.vehicleModelId,
        this.vehicleYear,
        this.vehicleColor,
        this.licensePlate,
        this.customerName,
        this.customerDocument,
        this.phoneNumber,
        this.email,
        this.addressStreet,
        this.addressNumber,
        this.addressComplement,
        this.addressNeighborhood,
        this.addressCity,
        this.addressState,
        this.postalCode,
        this.customerId,
        this.clientId,
        this.status,
    });

    DateTime? createdAt;
    DateTime? updatedAt;
    String? id;
    int? number;
    String? mileage;
    int? vehicleMakerId;
    int? vehicleModelId;
    String? vehicleYear;
    String? vehicleColor;
    String? licensePlate;
    String? customerName;
    String? customerDocument;
    String? phoneNumber;
    String? email;
    String? addressStreet;
    String? addressNumber;
    String? addressComplement;
    String? addressNeighborhood;
    String? addressCity;
    String? addressState;
    String? postalCode;
    String? customerId;
    String? clientId;
    String? status;

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
        number: json["number"],
        mileage: json["mileage"],
        vehicleMakerId: json["vehicle_maker_id"],
        vehicleModelId: json["vehicle_model_id"],
        vehicleYear: json["vehicle_year"],
        vehicleColor: json["vehicle_color"],
        licensePlate: json["license_plate"],
        customerName: json["customer_name"],
        customerDocument: json["customer_document"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        addressStreet: json["address_street"],
        addressNumber: json["address_number"],
        addressComplement: json["address_complement"],
        addressNeighborhood: json["address_neighborhood"],
        addressCity: json["address_city"],
        addressState: json["address_state"],
        postalCode: json["postal_code"],
        customerId: json["customer_id"],
        clientId: json["client_id"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "id": id,
        "number": number,
        "mileage": mileage,
        "vehicle_maker_id": vehicleMakerId,
        "vehicle_model_id": vehicleModelId,
        "vehicle_year": vehicleYear,
        "vehicle_color": vehicleColor,
        "license_plate": licensePlate,
        "customer_name": customerName,
        "customer_document": customerDocument,
        "phone_number": phoneNumber,
        "email": email,
        "address_street": addressStreet,
        "address_number": addressNumber,
        "address_complement": addressComplement,
        "address_neighborhood": addressNeighborhood,
        "address_city": addressCity,
        "address_state": addressState,
        "postal_code": postalCode,
        "customer_id": customerId,
        "client_id": clientId,
        "status": status,
    };

  static OrderModel? getByLicensePlate(List<OrderModel> orders, String licensePlate) {
    final data = orders.firstWhere(
      (e) => e.licensePlate?.toLowerCase() == licensePlate.toLowerCase()
    );
    return data;
  }
}

class Meta {
    Meta({
        this.totalItems,
        this.itemCount,
        this.itemsPerPage,
        this.totalPages,
        this.currentPage,
    });

    int? totalItems;
    int? itemCount;
    int? itemsPerPage;
    int? totalPages;
    int? currentPage;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalItems: json["totalItems"],
        itemCount: json["itemCount"],
        itemsPerPage: json["itemsPerPage"],
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "itemCount": itemCount,
        "itemsPerPage": itemsPerPage,
        "totalPages": totalPages,
        "currentPage": currentPage,
    };
}

  // Map<String, dynamic> toJsonPost() => {
  //       "customerId": '936be4b1-a1e6-43d2-a207-788e7f16fb34',
  //       "vehicleMakerId": vehicleMakerId,
  //       "vehicleModelId": vehicleModelId,
  //       "vehicleYear": '2021-1',
  //       "licensePlate": licensePlate,
  //       "mileage": mileage,
  //       "chassisNumber": chassisNumber,
  //       "clientId": clientId,
  //     };