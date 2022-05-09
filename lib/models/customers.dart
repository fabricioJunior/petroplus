// To parse this JSON data, do
//
//     final customers = customersFromJson(jsonString);

import 'dart:convert';

import 'package:petroplus/models/item_model.dart';
import 'package:petroplus/models/meta_model.dart';

Customers customersFromJson(String str) => Customers.fromJson(json.decode(str));

String customersToJson(Customers data) => json.encode(data.toJson());

class Customers {
  Customers({
    this.meta,
    this.items,
  });

  MetaModel? meta;
  List<ItemModel>? items;

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        meta: MetaModel?.fromJson(json["meta"]),
        items: json["items"] == null
            ? null
            : List<ItemModel>.from(
                json["items"].map((x) => ItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
