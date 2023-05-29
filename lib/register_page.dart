import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dokter/home_pageD.dart';
import 'login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'pasien/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final roleSelected = TextEditingController();

  _RegisterPageState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = [
    'Pasien',
    'Dokter',
  ];
  var _currentItemSelected = "Pasien";
  var role = "Pasien";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor("#F4F6FF"),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 40.w,
                            height: 40.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("assets/logo2.png"),
                            )),
                          ),
                          Text(
                            "\t\tDemen-Care",
                            style: TextStyle(
                                fontSize: 26.sp, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Exceptional Care Close to You",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      SizedBox(
                        width: 275.w,
                        height: 50.h,
                        child: TextFormField(
                          controller: userNameController,
                          decoration: const InputDecoration(
                            hintText: "Username",
                            enabled: true,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Username cannot be empty";
                            }
                            if (!RegExp("^[a-zA-Z0-9+_.-]").hasMatch(value)) {
                              return ("Please enter a valid username");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 275.w,
                        height: 50.h,
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            enabled: true,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 275.w,
                        height: 50.h,
                        child: TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            hintText: "Password",
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabled: true,
                          ),
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 275.w,
                        height: 50.h,
                        child: TextFormField(
                          obscureText: _isObscure2,
                          controller: confirmpassController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure2
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure2 = !_isObscure2;
                                  });
                                }),
                            hintText: "Confirm Password",
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabled: true,
                          ),
                          validator: (value) {
                            if (confirmpassController.text !=
                                passwordController.text) {
                              return "Password did not match";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      SizedBox(
                        width: 275.w,
                        child: DropdownButtonFormField<String>(
                          items: options.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(
                                dropDownStringItem,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValueSelected) {
                            setState(() {
                              _currentItemSelected = newValueSelected!;
                              role = newValueSelected;
                            });
                          },
                          value: _currentItemSelected,
                          icon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: HexColor("#206A5D"),
                          ),
                          dropdownColor: HexColor("#FAF9FE"),
                          decoration: InputDecoration(
                              labelText: "Select Your Role",
                              prefixIcon: Icon(Icons.accessibility_new_rounded,
                                  color: HexColor("#206A5D")),
                              border: const UnderlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 275.w,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showProgress = true;
                            });
                            signUp(
                                emailController.text,
                                passwordController.text,
                                role,
                                userNameController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HexColor("#81B214")),
                          child: Text(
                            "Sign-Up",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.off(const LoginPage());
                                },
                                child: Text(
                                  "Sign-In here",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.lightBlueAccent),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ));
  }

  void signUp(
      String email, String password, String role, String userName) async {
    const CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore(email, role, userName)});
        login(email, password);
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Text(
              e.toString(),
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
    const CircularProgressIndicator();
  }

  postDetailsToFirestore(String email, String role, String userName) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('akun');
    ref.doc(user!.uid).set(
        {'email': emailController.text, 'role': role, 'username': userName});
  }

  login(String email, String password) async {
    const CircularProgressIndicator();
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      route();
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Text(
            'Error',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('akun')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "Dokter") {
          Get.to(const HomePageDokter());
        } else {
          Get.offAll(const HomePage());
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
