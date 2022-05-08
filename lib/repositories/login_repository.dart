import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import '../consts/apis.dart';
import '../models/auth_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../errors/excepions.dart';
import '../errors/http_client_error_handler.dart';
import '../models/x_order_model.dart';

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

      final preferences = await SharedPreferences.getInstance();

      var isTokenSaved;

      if (tokenUser != null) {
        // await preferences.setString("token", tokenUser);
        isTokenSaved = await preferences.setString("token", tokenUser);
      }
      return isTokenSaved;
    } catch (e) {
      return false;
    }
  }

  Future<List<XOrderModel>> getXOrders() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString("token");

      final response = await _client.get(
        APIS.urlOrder, options: Options(headers: {"Authorization": "Bearer $token"})
      );

      final data = response.data['items'] as List;
      final xOrders = data.map((map) => XOrderModel.fromMap(map)).toList();

      return xOrders;
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }
}
