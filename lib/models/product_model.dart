import 'item_model.dart';
import 'meta_model.dart';

class ProductModel {
  ProductModel({
    this.meta,
    this.items,
  });

  MetaModel? meta;
  List<ItemModel>? items;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
