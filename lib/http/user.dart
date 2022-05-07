class AuthUser {
  String email;
  String password;

  AuthUser({required this.email, required this.password});

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    final email = json['email'];
    final password = json['password'];
    return AuthUser(email: email, password: password);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }

  String toString() {
    return "Email: $email \nSenha: $password";
  }
}
