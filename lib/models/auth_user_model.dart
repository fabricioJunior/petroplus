class AuthUserModel {
  String email;
  String password;

  AuthUserModel({required this.email, required this.password});

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    final email = json['email'];
    final password = json['password'];
    return AuthUserModel(email: email, password: password);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  @override
  String toString() {
    return "Email: $email \nSenha: $password";
  }
}
