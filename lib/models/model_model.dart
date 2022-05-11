import 'package:equatable/equatable.dart';

class Model extends Equatable {
  Model({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.makerId,
    this.name,
    this.years,
    this.tableId,
    this.image,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;
  int? makerId;
  String? name;
  List<String>? years;
  int? tableId;
  String? image;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
        makerId: json["maker_id"],
        name: json["name"],
        years: List<String>.from(json["years"].map((x) => x)),
        tableId: json["table_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "id": id,
        "maker_id": makerId,
        "name": name,
        "years":
            years == null ? null : List<dynamic>.from(years!.map((x) => x)),
        "table_id": tableId,
        "image": image,
      };

  @override
  List<Object?> get props => [
        createdAt,
        updatedAt,
        id,
        makerId,
        name,
        years,
        tableId,
        image,
      ];
}
