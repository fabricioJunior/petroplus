import 'item.dart';
import 'meta.dart';

class Produtc {
  Produtc({
    this.meta,
    this.items,
  });

  Meta? meta;
  List<Item>? items;

  factory Produtc.fromJson(Map<String, dynamic> json) => Produtc(
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
