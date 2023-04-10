import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes/login_page.dart';

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
        body: Container(
      padding: const EdgeInsets.only(top: 60),
      color: HexColor("#F4F6FF"),
      child: Container(
        margin: const EdgeInsets.only(right: 60, left: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/Logo2.png"),
                  )),
                ),
                const Text(
                  "\t\tDemen-Care",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Exceptional Care Close to You",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 55,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButtonFormField(
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
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const HomePage());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor("#81B214")),
                child: const Text(
                  "Sign-Up",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 2,
                  width: (MediaQuery.of(context).size.width - 120) / 5,
                  color: Colors.black54,
                ),
                const Text(
                  "\t\t\tOr Continue With\t\t\t",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                Container(
                  height: 2,
                  width: (MediaQuery.of(context).size.width - 120) / 5,
                  color: Colors.black54,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () {
                Get.to(const HomePage());
              },
              child: Container(
                height: 40,
                width: (MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                    color: HexColor("#FAF9FE"),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8, color: Colors.black.withOpacity(0.2)),
                      BoxShadow(
                          blurRadius: 8, color: Colors.black.withOpacity(0.2))
                    ]),
                child: Stack(
                  children: [
                    Container(
                      height: 30,
                      margin: const EdgeInsets.only(right: 150, top: 5),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/google.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 150, top: 12),
                      child: const Text(
                        "Sign Up With Google",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                Get.to(const HomePage());
              },
              child: Container(
                height: 40,
                width: (MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                    color: HexColor("#FAF9FE"),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8, color: Colors.black.withOpacity(0.2)),
                      BoxShadow(
                          blurRadius: 8, color: Colors.black.withOpacity(0.2))
                    ]),
                child: Stack(
                  children: [
                    Container(
                      height: 30,
                      margin: const EdgeInsets.only(right: 150, top: 5),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/apple.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 150, top: 12),
                      child: const Text(
                        "Sign Up With Apple",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const LoginPage());
                      },
                      child: const Text(
                        "Sign-In here",
                        style: TextStyle(
                            fontSize: 14, color: Colors.lightBlueAccent),
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
