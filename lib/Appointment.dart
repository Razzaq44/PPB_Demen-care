import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes/home_page.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: HexColor("#FFFFFF"),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(right: 40, left: 40, top: 20),
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height) / 4,
              decoration: BoxDecoration(
                color: HexColor("#FFFFFF"),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const HomePage());
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 16,
                      color: HexColor("#000000"),
                    ),
                  ),
                  Text(
                    "Appointment",
                    style: TextStyle(fontSize: 16, color: HexColor("#000000")),
                  ),
                  Icon(
                    Icons.menu,
                    size: 16,
                    color: HexColor("#000000"),
                  ),
                ],
              )),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: HexColor("#F4F6FF"),
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(50))),
          )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 32,
                    color: HexColor("#000000").withOpacity(0.5),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const HomePage());
                  },
                  child: Icon(
                    Icons.home_rounded,
                    size: 32,
                    color: HexColor("#000000").withOpacity(0.5),
                  ),
                  // child: Container(
                  //   width: 40,
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: AssetImage("assets/Logo.png"),
                  //           fit: BoxFit.cover)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Icon(Icons.settings,
                      size: 32, color: HexColor("#000000").withOpacity(0.5)),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
