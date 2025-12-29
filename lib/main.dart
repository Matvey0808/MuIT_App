import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:serviceapp/data/splash_data.dart';
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
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF8F8FF),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashView(model: splashModel),
    );
  }
}