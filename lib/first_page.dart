import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes/login_page.dart';
import 'package:get/get.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: HexColor("#FAF9FE"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) / 2.5,
                decoration: BoxDecoration(
                    color: HexColor("#9B0000"),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 250),
                height: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8, color: Colors.black.withOpacity(0.2)),
                      BoxShadow(
                          blurRadius: 8, color: Colors.black.withOpacity(0.2))
                    ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 270),
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/Logo.png")),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text("Demen-Care",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                  color: HexColor("#9B0000"))),
          Expanded(child: Container()),
          SizedBox(
            width: (MediaQuery.of(context).size.width) / 2.5,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor("#9B0000"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                Get.to(const LoginPage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16, fontFamily: 'Courgette'),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(Icons.arrow_forward_rounded)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    ));
  }
}
