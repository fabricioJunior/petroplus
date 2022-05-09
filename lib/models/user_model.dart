import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.clientId,
    this.role,
    this.status,
  });

  String? id;
  String? name;
  String? email;
  String? phone;
  String? clientId;
  String? role;
  String? status;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        clientId: json["clientId"],
        role: json["role"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "clientId": clientId,
        "role": role,
        "status": status,
      };
}
