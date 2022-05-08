import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
