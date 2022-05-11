import 'dart:convert';

import 'package:petroplus/models/meta_model.dart';

import 'item_model.dart';

ServiceModel serviceFromJson(String str) => ServiceModel.fromJson(json.decode(str));

String serviceToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  ServiceModel({
    this.meta,
    this.itemsModel,
  });

  MetaModel? meta;
  List<ItemModel>? itemsModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        meta: MetaModel.fromJson(json["meta"]),
        itemsModel: json["items"] != null ? List<ItemModel>.from(json["items"].map((x) => ItemModel.fromJson(x))) : null,
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "items": itemsModel == null
            ? null
            : List<dynamic>.from(itemsModel!.map((x) => x.toJson())),
      };
}
