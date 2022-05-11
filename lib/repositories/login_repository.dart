import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import '../models/auth_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {

  Future<bool> login(AuthUserModel authUser) async {
    try {
      final userAuth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authUser.email,
        password: authUser.password,
      );

      final tokenUser = await userAuth.user?.getIdToken();
      log(tokenUser!);
      final preferences = await SharedPreferences.getInstance();
      bool? isTokenSaved = false;
      isTokenSaved = await preferences.setString("token", tokenUser);

      return isTokenSaved;
    } catch (e) {
      e;
      return false;
    }
  }
}
