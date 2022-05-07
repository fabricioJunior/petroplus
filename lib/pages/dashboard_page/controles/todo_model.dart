class TodoModel {
  final String customer_name;
  final String status;
  final String? license_plate;

  TodoModel(
      {required this.customer_name,
      required this.status,
      required this.license_plate});

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
        customer_name: map["customer_name"],
        status: map["status"],
        license_plate: map["license_plate"]);
  }
}
