import 'package:flutter/material.dart';
import 'package:muit_app/Navigation/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurpleAccent)
      ),
      home: MainNavigationView(),
    );
  }
}
