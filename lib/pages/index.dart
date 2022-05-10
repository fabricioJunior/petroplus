import 'dart:developer';

import 'package:flutter/material.dart';
import '../alerts/alerts.dart';
import '../models/auth_user_model.dart';
import '../repositories/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service_locator.dart';
import 'dashboard_page/dashboard_page.dart';

class HomeSplash extends StatefulWidget {
  const HomeSplash({Key? key}) : super(key: key);

  @override
  State<HomeSplash> createState() => _HomeSplashState();
}

class _HomeSplashState extends State<HomeSplash> {
  final _formKey = GlobalKey<FormState>();
  // Map<String, String> _authData = {
  //   'email': '',
  //   'password': '',
  // };

  final TextEditingController _emailImputController = TextEditingController();
  final TextEditingController _senhaImputController = TextEditingController();

  var _isLoanding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// ------------------------------------------------Logo
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/fundo1.png'),
            fit: BoxFit.cover,
          ),
        ),
        // Fundo Branco
        child: Center(
          child: Container(
            width: 350,
            height: 480,
            color: Color.fromARGB(255, 252, 252, 252),
            // Conteudo
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo
                SizedBox(
                  width: 270,
                  child: Image.asset('assets/img/logo.png'),
                ),

                Container(
                  height: 50,
                ),
// ------------------------------------------------Entrar
                SizedBox(
                  width: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Entrar',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
// ------------------------------------------------Espaço
                SizedBox(
                  height: 10,
                ),
// ------------------------------------------------Input
                Container(
                  width: 280,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _emailImputController,
                          //onSaved: (email) => _authData['email'] = email ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Endereço de e-mail',
                            labelStyle: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 12,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 81, 0),
                              ),
                            ),
                          ),
                          validator: (_email) {
                            final email = _email ?? '';
                            if (email.trim().isEmpty || !email.contains('@')) {
                              return "Email Obrigatório";
                            }
                            return null;
                          },
                        ),
                        Container(
                          height: 8,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _senhaImputController,
                          //onSaved: (password) => _authData['password'] = password ?? '',
                          obscureText: true,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 12,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 81, 0),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.5),
                              ),
                            ),
                          ),
                          validator: (_password) {
                            final password = _password ?? '';
                            if (password.isEmpty || password.length < 5) {
                              return 'Senha muito curta';
                            }
                            return null;
                          },
                        ),

                        Container(
                          height: 15,
                        ),
// ------------------------------------------------Forgot/Sing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Esqueceu a senha?',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 255, 81, 0),
                                ),
                              ),
                            ),
                            if (_isLoanding) CircularProgressIndicator()
                            else
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 255, 81, 0),
                                ),
                                onPressed: _login,
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(24, 11, 24, 11),
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _login() async {
    
    final savedToken = await locator.get<LoginRepository>().login(AuthUserModel(
      email: _emailImputController.text,
      password: _senhaImputController.text),
    );

    // final preferences = await SharedPreferences.getInstance();
    // final token = preferences.getString("token");

    // log(token ?? '', error: 'TOKEN INVÁLIDO');

    if (savedToken) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return DashboardPage();
          },
        ),
      );
    } else {
      showAlert("Login Inválido!", isError: true);
    }
  }
}
