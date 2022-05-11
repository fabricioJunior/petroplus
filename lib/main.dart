import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:petroplus/service_locator.dart';

import 'adapters/cache/hive/storages_controller.dart';
import 'adapters/clients/firebase.dart';
import 'pages/splash.dart';
import 'storage/petroplus_storages.dart';

void main() async {
  await Hive.initFlutter();
  await inicializarStorage(PETROPLUS_STORAGES);
  WidgetsFlutterBinding.ensureInitialized();
  await initialyzeFirebase();
  await registerServices();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 49760);
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
