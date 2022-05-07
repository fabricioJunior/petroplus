import 'package:firebase_auth/firebase_auth.dart';
import 'package:petroplus/http/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  Future<bool> doLogin(AuthUser authUser) async {
    try {
      final userAuth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authUser.email,
        password: authUser.password,
      );

      final tokenUser = await userAuth.user?.getIdToken();

      final preferences = await SharedPreferences.getInstance();

      late final isTokenSaved;

      if (tokenUser != null) {
        // await preferences.setString("token", tokenUser);
        isTokenSaved = await preferences.setString("token", tokenUser);
      }
      return isTokenSaved;
    } catch (e) {
      return false;
    }
  }
}
