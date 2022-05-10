import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/auth_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  final Dio _client;

  LoginRepository(this._client);

  Future<bool> login(AuthUserModel authUser) async {
    try {
      final userAuth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authUser.email,
        password: authUser.password,
      );

      final tokenUser = await userAuth.user?.getIdToken();

      log(tokenUser!);

      final preferences = await SharedPreferences.getInstance();

      bool isTokenSaved = false;

      if (tokenUser != null) {
        // await preferences.setString("token", tokenUser);
        isTokenSaved = await preferences.setString("token", tokenUser);
      }
      return isTokenSaved;
    } catch (e) {
      e;
      return false;
    }
  }
}
