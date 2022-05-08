class XOrderModel {
  final String customer_name;
  final String status;
  final String? license_plate;

  XOrderModel(
      {required this.customer_name,
      required this.status,
      required this.license_plate});

  factory XOrderModel.fromMap(Map<String, dynamic> map) {
    return XOrderModel(
      customer_name: map["customer_name"],
      status: map["status"],
      license_plate: map["license_plate"]
    );
  }
}
