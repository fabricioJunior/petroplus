// To parse this JSON data, do
//
//     final customers = customersFromJson(jsonString);

import 'dart:convert';

import 'package:petroplus/models/item.dart';
import 'package:petroplus/models/meta.dart';

Customers customersFromJson(String str) => Customers.fromJson(json.decode(str));

String customersToJson(Customers data) => json.encode(data.toJson());

class Customers {
  Customers({
    this.meta,
    this.items,
  });

  Meta? meta;
  List<Item>? items;

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        meta: Meta.fromJson(json["meta"]),
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
