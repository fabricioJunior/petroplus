import 'package:petroplus/models/item_model.dart';
import 'package:petroplus/models/meta_model.dart';

class ProductsModel {
  ProductsModel({
    this.metaModel,
    this.itemsModel,
  });

  MetaModel? metaModel;
  List<ItemModel>? itemsModel;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        metaModel: MetaModel.fromJson(json["meta"]),
        itemsModel: List<ItemModel>.from(json["items"].map((x) => ItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": metaModel?.toJson(),
        "items": itemsModel == null
            ? null
            : List<dynamic>.from(itemsModel!.map((x) => x.toJson())),
      };
}
