// To parse this JSON data, do
//
//     final productMediaModel = productMediaModelFromJson(jsonString);

import 'dart:convert';

import 'package:petroplus/models/order_model.dart';

ProductMediaModel productMediaModelFromJson(String str) => ProductMediaModel.fromJson(json.decode(str));

String productMediaModelToJson(ProductMediaModel data) => json.encode(data.toJson());

class ProductMediaModel {
    ProductMediaModel({
        this.createdAt,
        this.updatedAt,
        this.id,
        this.name,
        this.quantity,
        this.internalId,
        this.price,
        this.description,
        this.isRecommendation = false,
        this.clientId,
        this.deletedAt,
        this.medias,
        this.orders,
    });

    DateTime? createdAt;
    DateTime? updatedAt;
    String? id;
    String? name;
    int? quantity;
    String? internalId;
    String? price;
    String? description;
    bool isRecommendation;
    String? clientId;
    dynamic deletedAt;
    List<MediaModel>? medias;
    List<OrderModel>? orders;

    factory ProductMediaModel.fromJson(Map<String, dynamic> json) => ProductMediaModel(
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
        deletedAt: json["deleted_at"],
        medias: List<MediaModel>.from(json["medias"].map((x) => MediaModel.fromJson(x))),
        orders: List<OrderModel>.from(json["vehicles"].map((x) => OrderModel.fromJson(x))),
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
        "deleted_at": deletedAt,
        "medias": medias != null ? List<dynamic>.from(medias!.map((x) => x.toJson())) : null,
        "vehicles": orders != null ? List<dynamic>.from(orders!.map((x) => x)) : null,
    };
}

class MediaModel {
    MediaModel({
        this.createdAt,
        this.updatedAt,
        this.id,
        this.productId,
        this.mediaType,
        this.url,
        this.isPrincipal = false,
    });

    DateTime? createdAt;
    DateTime? updatedAt;
    String? id;
    String? productId;
    String? mediaType;
    String? url;
    bool isPrincipal;

    factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
        productId: json["product_id"],
        mediaType: json["media_type"],
        url: json["url"],
        isPrincipal: json["is_principal"],
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "id": id,
        "product_id": productId,
        "media_type": mediaType,
        "url": url,
        "is_principal": isPrincipal,
    };
}
