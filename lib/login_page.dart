import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:tubes/home_page.dart';
import 'package:tubes/register_page.dart';

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
                    image: AssetImage("assets/logo2.png"),
                  )),
                ),
                Text(
                  "\t\tDemen-Care",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#000000")),
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
              children: [
                TextFormField(
                  controller: username,
                  decoration: const InputDecoration(
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
              children: [
                TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_rounded)),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Recovery Password",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const HomePage());
                  clearText();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor("#81B214")),
                child: const Text(
                  "Sign-In",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
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
                clearText();
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      // margin: const EdgeInsets.only(right: 150, top: 5),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/google.png"),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Sign Up With Google",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Get.to(const HomePage());
                clearText();
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      // margin: const EdgeInsets.only(right: 150, top: 5),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/apple.png"),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Sign Up With Apple",
                      style: TextStyle(fontSize: 14, color: Colors.black),
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
                    "Don't have an account yet?",
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const RegisterPage());
                      },
                      child: const Text(
                        "Sign-Up here",
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
