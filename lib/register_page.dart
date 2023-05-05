import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final roleSelected = TextEditingController();

  _RegisterPageState() {
    selectRole = rolesList[0];
  }

  String? selectRole = "";

  final rolesList = ["Pasien", "Dokter"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: HexColor("#F4F6FF"),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
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
                        decoration: const InputDecoration(
                          labelText: "Password",
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
                        decoration: const InputDecoration(
                          labelText: "Confirm Password",
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
                      child: DropdownButtonFormField(
                        value: selectRole,
                        items: rolesList
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectRole = val as String;
                          });
                        },
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
                          Get.to(const HomePage());
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
                      },
                      child: Container(
                        height: 50.h,
                        width: 275.w,
                        decoration: BoxDecoration(
                            color: HexColor("#FAF9FE"),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.black.withOpacity(0.2)),
                              BoxShadow(
                                  blurRadius: 8,
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
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.black),
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
                      },
                      child: Container(
                        height: 50.h,
                        width: 275.w,
                        decoration: BoxDecoration(
                            color: HexColor("#FAF9FE"),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.black.withOpacity(0.2)),
                              BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.black.withOpacity(0.2))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 30.w,
                              width: 30.w,
                              // margin: const EdgeInsets.only(right: 150, top: 5),
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
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.black),
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
                            "Already have an account?",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(const LoginPage());
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
              )
            ]),
          ),
        ));
  }
}
