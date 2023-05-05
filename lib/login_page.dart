import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:tubes/home_page.dart';
import 'package:tubes/register_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  void clearText() {
    username.clear();
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor("#F4F6FF"),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
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
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 60.h,
                ),
                SizedBox(
                  width: 275.w,
                  height: 50.h,
                  child: TextFormField(
                    controller: username,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 275.w,
                  height: 50.h,
                  child: TextFormField(
                    obscureText: true,
                    controller: password,
                    decoration: const InputDecoration(
                        labelText: "Password",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        suffixIcon: Icon(Icons.remove_red_eye_rounded)),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Recovery Password",
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 275.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const HomePage());
                      clearText();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2.h,
                      width: 80.w,
                      color: Colors.black54,
                    ),
                    Text(
                      "\t\t\tOr Continue With\t\t\t",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      height: 2.h,
                      width: 80.w,
                      color: Colors.black54,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const HomePage());
                    clearText();
                  },
                  child: Container(
                    height: 50.h,
                    width: 275.w,
                    decoration: BoxDecoration(
                        color: HexColor("#FAF9FE"),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8.r,
                              color: Colors.black.withOpacity(0.2)),
                          BoxShadow(
                              blurRadius: 8.r,
                              color: Colors.black.withOpacity(0.2))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.w,
                          width: 30.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/google.png"),
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "Sign Up With Google",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const HomePage());
                    clearText();
                  },
                  child: Container(
                    height: 50.h,
                    width: 275.w,
                    decoration: BoxDecoration(
                        color: HexColor("#FAF9FE"),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8.r,
                              color: Colors.black.withOpacity(0.2)),
                          BoxShadow(
                              blurRadius: 8.r,
                              color: Colors.black.withOpacity(0.2))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.w,
                          width: 30.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/apple.png"),
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "Sign Up With Apple",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                        )
                      ],
                    ),
                  ),
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
        ));
  }
}
