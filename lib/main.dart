import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:serviceapp/data/colors_data.dart';
import 'package:serviceapp/data/registration_data.dart';
import 'package:serviceapp/data/sign_in_data.dart';
import 'package:serviceapp/data/sign_up_data.dart';
import 'package:serviceapp/data/splash_data.dart';
import 'package:serviceapp/models/registration_model.dart';
import 'package:serviceapp/models/sign_in_model.dart';
import 'package:serviceapp/viewmodels/splash_view_model.dart';
import 'package:serviceapp/views/registration_view.dart';
import 'package:serviceapp/views/sign_in_view.dart';
import 'package:serviceapp/views/sign_up_view.dart';
import 'package:serviceapp/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => SplashViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFF8F8FF)),
      debugShowCheckedModeBanner: false,
      home: SignInView(
        colors: ColorApp,
        signin: SignInModels,
        model: registrationModel,
      ),
      routes: {
        '/registration': (context) =>
            const RegistrationView(model: registrationModel, colors: ColorApp),
      },
    );
  }
}
