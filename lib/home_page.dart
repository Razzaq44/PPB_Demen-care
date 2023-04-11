import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Map<String, dynamic>> menu = [
  {
    "title": "Test Demensia",
    "desc":
        "Ayo lakukan test demensia untuk mengetahui cara penanganan yang tepat",
    "image": "assets/test.png",
    "page": "login"
  },
  {
    "title": "Appointment",
    "desc": "Buat jadwal temu bersama dokter pilihanmu segera",
    "image": "assets/appointment.png",
    "page": "appointment"
  },
  {
    "title": "Diagnosis",
    "desc":
        "Ayo lakukan test demensia untuk mengetahui cara penanganan yang tepat..",
    "image": "assets/test.png",
    "page": "diagnosis"
  },
  {
    "title": "Medicine",
    "desc":
        "Ayo lakukan test demensia untuk mengetahui cara penanganan yang tepat..",
    "image": "assets/test.png",
    "page": "medicine"
  },
  {
    "title": "3",
    "desc":
        "Ayo lakukan test demensia untuk mengetahui cara penanganan yang tepat..",
    "image": "assets/test.png",
    "page": "login"
  },
  {
    "title": "Medical Records",
    "desc":
        "Ayo lakukan test demensia untuk mengetahui cara penanganan yang tepat..",
    "image": "assets/test.png",
    "page": "medicalrecords"
  },
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: HexColor("#F4F6FF"),
            ),
            child: Column(
              children: [
                // Container(
                //   padding: EdgeInsets.only(right: 50, left: 40, top: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Icon(Icons.arrow_back_ios_new_rounded),
                //       Container(
                //           alignment: Alignment.center,
                //           width: 50,
                //           height: 50,
                //           decoration: BoxDecoration(
                //               image: DecorationImage(
                //             image: AssetImage("assets/Logo.png"),
                //           ))),
                //       Icon(Icons.info_outline_rounded),
                //     ],
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.only(
                      right: 40, left: 40, top: 20, bottom: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor('#000000'),
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                "Carolina Terner",
                                style: TextStyle(
                                    fontSize: 22, color: HexColor('#000000')),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          TextButton(
                            onPressed: () {
                              Get.to(const LoginPage());
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage("assets/Logo2.png"),
                                        fit: BoxFit.fitWidth))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 310,
                  color: Colors.white10.withOpacity(0.1),
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(menu[index]["page"].toString());
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.all(20),
                                height: 120,
                                width:
                                    (MediaQuery.of(context).size.width) / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("#FFFFFF"),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          blurRadius: 6,
                                          color: HexColor("#BFDCAE")
                                              .withOpacity(0.2)),
                                      BoxShadow(
                                          offset: const Offset(-1, -1),
                                          blurRadius: 6,
                                          color: HexColor("#BFDCAE")
                                              .withOpacity(0.2)),
                                    ]),
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 200),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${menu[index]["title"]}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                                color: HexColor("#000000")),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text("${menu[index]["desc"]}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: HexColor("#000000")
                                                      .withOpacity(0.6)))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 260),
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  menu[index]["image"]),
                                              fit: BoxFit.fitHeight)),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  decoration: BoxDecoration(
                      color: HexColor("#F4F6FF"),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: OverflowBox(
                    maxWidth: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: (menu.length.toDouble() - 2) ~/ 2,
                      itemBuilder: (context, index) {
                        int a = 2 * index + 2;
                        int b = 2 * index + 1 + 2;
                        return Container(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(menu[a]["page"].toString());
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  margin: const EdgeInsets.only(
                                      left: 40, right: 20, bottom: 20),
                                  width: ((MediaQuery.of(context).size.width) -
                                          120) /
                                      2,
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Text(
                                        "${menu[a]["title"]}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          height: 80,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      menu[a]["image"]))))
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(menu[b]["page"].toString());
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  margin: const EdgeInsets.only(
                                      right: 40, bottom: 15),
                                  width: ((MediaQuery.of(context).size.width) -
                                          120) /
                                      2,
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Text(
                                        "${menu[b]["title"]}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          height: 80,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      menu[b]["image"]))))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
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
                          color: HexColor("#000000").withOpacity(0.8),
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
                            size: 32,
                            color: HexColor("#000000").withOpacity(0.5)),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
