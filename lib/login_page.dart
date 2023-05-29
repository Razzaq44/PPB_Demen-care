import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'pasien/home_page.dart';
import 'register_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dokter/home_pageD.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor("#F4F6FF"),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
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
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#1F1A3D")),
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
                    height: 60.h,
                  ),
                  SizedBox(
                    width: 275.w,
                    height: 50.h,
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        enabled: true,
                        hintText: "Email",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value!.length == 0) {
                          return "Email cannot be empty";
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please enter a valid email");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        emailController.text = value!;
                      },
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
                      obscureText: _isObscure3,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure3
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure3 = !_isObscure3;
                              });
                            }),
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
                      onSaved: (value) {
                        passwordController.text = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
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
                          visible = true;
                        });
                        signIn(emailController.text, passwordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor("#81B214")),
                      child: Text(
                        "Sign-In",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
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
                          "Don't have an account yet?",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(const RegisterPage());
                            },
                            child: Text(
                              "Sign-Up here",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.lightBlueAccent,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
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
          Get.offAll(const HomePageDokter());
        } else {
          Get.offAll(const HomePage());
        }
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            message: 'Email and password does not match',
            icon: Icon(Icons.refresh),
            duration: Duration(seconds: 3),
          ),
        );
      }
      return const CircularProgressIndicator();
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.showSnackbar(
            const GetSnackBar(
              message: 'User Not Found',
              icon: Icon(Icons.close),
              duration: Duration(seconds: 3),
            ),
          );
        } else if (e.code == 'wrong-password') {
          Get.showSnackbar(
            const GetSnackBar(
              message: 'Wrong password provided for that user.',
              icon: Icon(Icons.close),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    }
  }
}
