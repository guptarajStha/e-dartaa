import 'package:e_darta_test/auth/authpage.dart';
import 'package:e_darta_test/login%20and%20signup/loginpage.dart';
import 'package:e_darta_test/menu.dart';
// import 'package:e_darta_test/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainMenu();
          } else
            return AuthPage();
        },
      ),
    );
  }
}
