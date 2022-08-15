import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_darta_test/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class Process extends StatefulWidget {
  @override
  State<Process> createState() => _ProcessState();
}

class _ProcessState extends State<Process> {
  final user = FirebaseAuth.instance.currentUser!;
  // File? image;
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     setState(() {
  //       this.image = imageTemporary;
  //     });
  //   } on PlatformException catch (e) {
  //     print('fail to pick image: $e');
  //   }
  // }

  int currentStep = 0;
  final address = TextEditingController();
  final fullName = TextEditingController();
  final emailAddress = TextEditingController();
  final phoneNumber = TextEditingController();
  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final dateOfBirth = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Citizenship Registration"),
        backgroundColor: HexColor("#db615e"),
      ),
      body: Container(
        child: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
            primary: HexColor("#db615e"),
          )),
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              setState(() {
                final isLastStep = currentStep == getSteps().length - 1;
                if (isLastStep) {
                  Navigator.pushNamed(context, MyRoutes.mainMenu);
                }
                // else if (isLastStep) {
                //   print('Completed');
                // }
                else
                  currentStep += 1;
              });
            },
            onStepCancel: () {
              currentStep == 0
                  ? null
                  : setState(() {
                      currentStep -= 1;
                    });
            },
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: Text("Info"),
          content: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: fullName,
                  decoration: InputDecoration(
                    labelText: 'Your Full Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "required";
                    } else
                      return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "required";
                    } else
                      return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "required";
                    } else
                      return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: fatherName,
                  decoration: InputDecoration(
                    labelText: 'Father\'s Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "required";
                    } else
                      return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: motherName,
                  decoration: InputDecoration(
                    labelText: 'Mother\'s Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "required";
                    } else
                      return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: address,
                  decoration: InputDecoration(
                    labelText: 'Address',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "required";
                    } else
                      return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  controller: dateOfBirth,
                  decoration: InputDecoration(
                    labelText: 'dd-mm-yyyy DOB',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "required";
                    } else
                      return null;
                  },
                ),
                FlatButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   return;
                    // } else {
                    final user = User(
                      name: fullName.text,
                      email: emailAddress.text,
                      phoneNo: phoneNumber.text,
                      dob: dateOfBirth.text,
                      fathername: fatherName.text,
                      mothername: motherName.text,
                      addresS: address.text,
                    );
                    createUser(user);
                    // }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          title: Text("Document"),
          content: Column(
            children: [Text("Under Construction")],
            // crossAxisAlignment: CrossAxisAlignment.start,
            // children: [
            //   Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(1),
            //       border: Border.all(color: Colors.black),
            //     ),
            //     width: 100,
            //     height: 100,
            //     // color: Colors.white,
            //     child: Icon(CupertinoIcons.photo),
            //   ),
            //   Text("Passport sized")
            // ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: Text("Payment"),
          content: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: HexColor("#db615e")),
                    width: 250,
                    height: 50,
                    // color: HexColor("#db615e"),
                    child: Center(
                      child: Text(
                        "Click Here For Payment",
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 3,
          title: Text("Complete"),
          content: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    height: 100,
                    width: 320,

                    // color: HexColor("#db615e"),
                    decoration: BoxDecoration(
                      color: HexColor("#f9e9e8"),
                    ),

                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Congratulation, Your Form has been successfully filled and Check your email adddress for Confirmation",
                          textScaleFactor: 1.3,
                          style: TextStyle(color: HexColor("#db615e")),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text("Click continue to return to MainMenu"),
              ],
            ),
          ),
        ),
      ];
}

Future createUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  user.id = docUser.id;

  final json = user.toJson();

  await docUser.set(json);
}

class User {
  String id;
  final String name;
  final String email;
  final String phoneNo;
  final String addresS;
  final String fathername;
  final String mothername;
  final String dob;

  User({
    this.id = '',
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.addresS,
    required this.fathername,
    required this.mothername,
    required this.dob,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'fatherName': fathername,
        'motherName': mothername,
        'DOB': dob,
        'Address': addresS,
        'email': email,
        'phoneNO.': phoneNo,
      };
}

// Widget buildButton({
//   required String title,
//   required VoidCallback onClicked,
// }) =>
//     ElevatedButton(
//         onPressed: onClicked,
//         child: Row(
          //   final user = User(
          //   first name : firstName.text,
          //   middle name : middleName.text,
          //   last name : lastName.text,
          //   father name : fatherName.text,
          //   grand father name : gfatherName.text,
          //   temporary address : tempaddress.text,
          //   permanent address: peraddress.text,
          //   date of birth : DateTime.parse(dob.text),
          //   email : Email.parse(emailAddress.text),
          //   phone : Number.parse(phoneNumber.text),
          //  );

          //  createUser(user);
        //   children: [
        //     Text(title),
        //   ],
        // ));
// Future createUser(User user) async {
//   final docUser = FirebaseFirestore.instance.collection('users').doc();
//   user.id = docUser.id;
//   final json = user.toJson();
//   await docUser.get(json);
// }
