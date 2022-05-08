import 'dart:convert';

import 'package:petroplus/models/meta_model.dart';

import 'item_model.dart';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
    this.meta,
    this.items,
  });

  MetaModel? meta;
  List<ItemModel>? items;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        meta: MetaModel.fromJson(json["meta"]),
        items: List<ItemModel>.from(json["items"].map((x) => ItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
