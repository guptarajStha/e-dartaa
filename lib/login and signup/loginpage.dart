import 'package:e_darta_test/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LogInPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LogInPage({super.key, required this.showRegisterPage});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // final _auth = FirebaseAuth.instance;
  // String email = "";
  // String password = "";
  // final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.6,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  // fillColor: HexColor("#f9e9e8"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      // color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      // color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      // color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      // color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(42),
                  ),
                  hintText: "Email",
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
                // onChanged: (value) {
                //   setState(() {
                //     email = value.trim();
                //     //value.trim();
                //   });
                // },
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return "";
                //   } else
                //     return null;
                // },
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (email) =>
                //     email != null && EmailValidator.validate(email)
                //         ? 'Enter a valid email'
                //         : null,
              ),
              // TextFormField(
              //   // controller: emailController,
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(
              //     filled: true,
              //     fillColor: Colors.white,
              //     // fillColor: HexColor("#f9e9e8"),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(
              //         width: 0,
              //         // color: Colors.blue,
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(
              //         width: 0,
              //         // color: Colors.blue,
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     errorBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(
              //         width: 0,
              //         // color: Colors.blue,
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     focusedErrorBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(
              //         width: 0,
              //         // color: Colors.blue,
              //       ),
              //       borderRadius: BorderRadius.circular(42),
              //     ),
              //     hintText: "Email",
              //     icon: Icon(
              //       Icons.email,
              //       color: Colors.white,
              //     ),
              //   ),
              //   onChanged: (value) {
              //     setState(() {
              //       email = value.trim();
              //       //value.trim();
              //     });
              //   },
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return "";
              //     } else
              //       return null;
              //   },
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              // ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: TextField(
                controller: passwordController,
                // keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) => value != null && value.length < 6
                //     ? 'Enter min 6 character'
                //     : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  // fillColor: HexColor("#f9e9e8"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      // color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      // color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      // color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      // color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Password",
                  icon: Icon(
                    Icons.key,
                    color: Colors.white,
                  ),
                ),
                // decoration: InputDecoration(
                //   hintText: "Password",
                //   icon: Icon(
                //     Icons.key,
                //     color: HexColor("ed8a76"),
                //   ),
                // ),
                // onChanged: (value) {
                //   setState(() {
                //     password = value.trim();
                //     // value.trim();
                //   });
                // },
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return "";
                //   } else
                //     return null;
                // },
              ),
              // TextFormField(
              //   // controller: passwordController,
              //   // keyboardType: TextInputType.visiblePassword,
              //   obscureText: true,
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   decoration: InputDecoration(
              //     filled: true,
              //     fillColor: Colors.white,
              //     // fillColor: HexColor("#f9e9e8"),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(
              //         width: 0,
              //         // color: Colors.blue,
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(
              //         width: 0,
              //         // color: Colors.blue,
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     errorBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(
              //         width: 0,
              //         // color: Colors.blue,
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     focusedErrorBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(
              //         width: 0,
              //         // color: Colors.blue,
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     hintText: "Password",
              //     icon: Icon(
              //       Icons.key,
              //       color: Colors.white,
              //     ),
              //   ),
              //   // decoration: InputDecoration(
              //   //   hintText: "Password",
              //   //   icon: Icon(
              //   //     Icons.key,
              //   //     color: HexColor("ed8a76"),
              //   //   ),
              //   // ),
              //   onChanged: (value) {
              //     setState(() {
              //       password = value.trim();
              //       // value.trim();
              //     });
              //   },
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return "";
              //     } else
              //       return null;
              //   },
              // ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5.1,
            ),
            Column(
              children: [
                CupertinoButton(
                  child: Text("Log In"),
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor("ed8a76"),
                  onPressed: signIn, //=> moveToLogIn(context),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                InkWell(
                  child: Container(
                    child: Text(
                      "Create New Account",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        color: Color.fromARGB(138, 198, 89, 16),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  onTap: widget.showRegisterPage,
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  // moveToHome(BuildContext context) {
  //   if (_formKey.currentState!.validate()) {
  //     // auth.signInWithEmailAndPassword(email: _email, password: _password);
  //     setState(() {});
  //     Navigator.pushNamed(context, MyRoutes.mainMenu);
  //   }
  // }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
