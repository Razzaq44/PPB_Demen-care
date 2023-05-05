import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    "page": "test_demensia"
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
    "image": "assets/diagnosis.png",
    "page": "diagnosis"
  },
  {
    "title": "Resep Obat",
    "desc":
        "Ayo lakukan test demensia untuk mengetahui cara penanganan yang tepat..",
    "image": "assets/medPre.png",
    "page": "medpre"
  },
  {
    "title": "Medical Records",
    "desc":
        "Ayo lakukan test demensia untuk mengetahui cara penanganan yang tepat..",
    "image": "assets/medRec.png",
    "page": "medicalrecords"
  },
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bodyHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor("#F4F6FF"),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: 375.w,
                height: 55.w,
                padding: EdgeInsets.only(top: 8.h, right: 30.w, left: 30.w),
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
                                  fontSize: 14.sp,
                                  color: HexColor('#000000'),
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "Carolina Terner",
                              style: TextStyle(
                                  fontSize: 18.sp, color: HexColor('#000000')),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        InkWell(
                          onTap: () {
                            Get.to(const LoginPage());
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 40.w,
                              height: 40.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage("assets/logo2.png"),
                                      fit: BoxFit.fitWidth))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Container(
                      height: bodyHeight * 0.50,
                      color: Colors.white10.withOpacity(0.1),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20.h,
                          );
                        },
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(menu[index]["page"].toString());
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 15.h,
                                      bottom: 5.h,
                                      left: 15.w,
                                    ),
                                    height: 115.w,
                                    width: 315.w,
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
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 175.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${menu[index]["title"]}",
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: HexColor("#000000")),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text("${menu[index]["desc"]}",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: HexColor("#000000")
                                                          .withOpacity(0.6))),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 80.w,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      menu[index]["image"]),
                                                  fit: BoxFit.fitWidth)),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: HexColor("#F4F6FF"),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: (menu.length.toDouble() - 3) ~/ 2,
                    itemBuilder: (context, index) {
                      int a = 2 * index + 3;
                      int b = 2 * index + 2 + 2;
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(menu[a]["page"].toString());
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 7.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.only(
                                  left: 25.w, right: 45.w, bottom: 15.h),
                              width: 135.w,
                              height: 135.h,
                              child: Column(
                                children: [
                                  Text(
                                    "${menu[a]["title"]}",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                      height: 70.w,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(menu[a]["image"]),
                                              fit: BoxFit.fitWidth)))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(menu[b]["page"].toString());
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 7.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              margin:
                                  EdgeInsets.only(right: 25.w, bottom: 15.h),
                              width: 135.w,
                              height: 135.h,
                              child: Column(
                                children: [
                                  Text(
                                    "${menu[b]["title"]}",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                      height: 70.w,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(menu[b]["image"]),
                                              fit: BoxFit.fitWidth)))
                                ],
                              ),
                            ),
                          )
                        ],
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
          ),
        ));
  }
}
