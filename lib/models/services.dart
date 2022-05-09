import 'dart:convert';

import 'package:petroplus/models/item_model.dart';
import 'package:petroplus/models/meta_model.dart';

Services serviceFromJson(String str) => Services.fromJson(json.decode(str));

String serviceToJson(Services data) => json.encode(data.toJson());

class Services {
  Services({
    this.meta,
    this.items,
  });

  MetaModel? meta;
  List<ItemModel>? items;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        meta: MetaModel.fromJson(json["meta"]),
        items: json["items"] != null
            ? List<ItemModel>.from(
                json["items"].map((x) => ItemModel.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
