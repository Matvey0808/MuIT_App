import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:serviceapp/data/colors_data.dart';
import 'package:serviceapp/views/registration_view.dart';
import 'package:serviceapp/views/sign_in_view.dart';
import 'package:serviceapp/views/sign_up_view.dart';
import 'package:serviceapp/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFF8F8FF)),
      debugShowCheckedModeBanner: false,
      home: SplashView(colors: ColorApp),
      routes: {
        '/registration': (context) => const RegistrationView(colors: ColorApp),
      },
    );
  }
}
