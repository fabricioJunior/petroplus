import 'package:flutter/material.dart';
import 'package:petroplus/service_locator.dart';

import 'adapters/clients/firebase.dart';
import 'pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialyzeFirebase();
  await registerServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
