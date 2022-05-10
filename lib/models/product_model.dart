import 'item_model.dart';
import 'meta_model.dart';

class ProductModel {
  ProductModel({
    this.meta,
    this.itemsModel,
  });

  MetaModel? meta;
  List<ItemModel>? itemsModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        meta: MetaModel.fromJson(json["meta"]),
        itemsModel: List<ItemModel>.from(json["items"].map((x) => ItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "items": itemsModel == null
            ? null
            : List<dynamic>.from(itemsModel!.map((x) => x.toJson())),
      };
}
