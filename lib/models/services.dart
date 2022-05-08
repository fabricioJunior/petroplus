import 'dart:convert';

import 'package:petroplus/models/meta.dart';

import 'item.dart';

Services serviceFromJson(String str) => Services.fromJson(json.decode(str));

String serviceToJson(Services data) => json.encode(data.toJson());

class Services {
  Services({
    this.meta,
    this.items,
  });

  Meta? meta;
  List<Item>? items;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
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
