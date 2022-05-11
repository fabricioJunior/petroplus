import 'package:equatable/equatable.dart';

class MarkModel extends Equatable {
  MarkModel({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.tableId,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;
  String? name;
  int? tableId;

  factory MarkModel.fromJson(Map<String, dynamic> json) => MarkModel(
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
        name: json["name"],
        tableId: json["table_id"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "id": id,
        "name": name,
        "table_id": tableId,
      };

  @override
  List<Object?> get props => [
        createdAt,
        updatedAt,
        id,
        name,
        tableId,
      ];
}
