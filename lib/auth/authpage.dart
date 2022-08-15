import 'package:e_darta_test/login%20and%20signup/loginpage.dart';
import 'package:e_darta_test/login%20and%20signup/signup.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LogInPage(showRegisterPage: toogleScreen);
    } else {
      return SignUp(showLoginPage: toogleScreen);
    }
  }

  void toogleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
}
