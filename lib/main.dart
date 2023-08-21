import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bolc_firebase_login_apk/firebase_options.dart';
import 'package:bolc_firebase_login_apk/views/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const App(),
  );
}
