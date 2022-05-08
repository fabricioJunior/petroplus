import 'dart:convert';

import 'package:petroplus/models/meta.dart';

import 'item.dart';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
    this.meta,
    this.items,
  });

  Meta? meta;
  List<Item>? items;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        meta: Meta.fromJson(json["meta"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
