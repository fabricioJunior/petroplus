class ItemModel {
  ItemModel({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.quantity,
    this.internalId,
    this.price,
    this.description,
    this.isRecommendation,
    this.clientId,
    this.deletedAt,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  String? name;
  int? quantity;
  String? internalId;
  int? price;
  String? description;
  bool? isRecommendation;
  String? clientId;
  DateTime? deletedAt;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        internalId: json["internal_id"],
        price: json["price"],
        description: json["description"],
        isRecommendation: json["is_recommendation"],
        clientId: json["client_id"],
        deletedAt: DateTime.parse(json["deleted_at"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "id": id,
        "name": name,
        "quantity": quantity,
        "internal_id": internalId,
        "price": price,
        "description": description,
        "is_recommendation": isRecommendation,
        "client_id": clientId,
        "deleted_at": deletedAt?.toIso8601String(),
      };
}
