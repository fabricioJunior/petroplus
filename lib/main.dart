import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petroplus/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'controler_provider/inc_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDJ4BVZTJv6hPJBg9PUmjS6XZBc7SmX8BM",
        authDomain: "petroplay-stp.firebaseapp.com",
        projectId: "petroplay-stp",
        storageBucket: "petroplay-stp.appspot.com",
        messagingSenderId: "558302509436",
        appId: "1:558302509436:web:5c34b26d3f9af2471d4cf9",
        measurementId: "G-HVJQFXQWMS",
      ),
    );
  }

  // await FirebaseAuth.instance.useAuthEmulator('localhost', 49760);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IncController(),
        ),
      ],
      child: const MaterialApp(
        // home: ChangeNotifierProvider(
        home: SplachScreen(),
        //   create: (_) => IncController(),
        // ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
