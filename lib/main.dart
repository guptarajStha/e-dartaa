import 'package:e_darta_test/Citizenprocess/process.dart';
import 'package:e_darta_test/login%20and%20signup/loginpage.dart';
import 'package:e_darta_test/login%20and%20signup/signup.dart';
import 'package:e_darta_test/login.dart';
import 'package:e_darta_test/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth/checkpage.dart';
import 'menu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CheckPage(),
      routes: {
        MyRoutes.mainMenu: (context) => MainMenu(),
        // MyRoutes.test: (context) => LogInPage(),
        MyRoutes.check: (context) => CheckPage(),
        MyRoutes.process: (context) => Process(),
      },
    );
  }
}
