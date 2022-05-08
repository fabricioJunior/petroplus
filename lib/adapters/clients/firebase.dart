import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future<void> initialyzeFirebase() async {
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
}