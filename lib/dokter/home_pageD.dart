import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../database/helper.dart';

class HomePageDokter extends StatefulWidget {
  const HomePageDokter({super.key});

  @override
  State<HomePageDokter> createState() => _HomePageDokterState();
}

List<Map<String, dynamic>> menu = [
  {
    "title": "Appointment",
    "desc": "Konfirmasi jadwal temu bersama pasienmu",
    "image": "assets/appointment.png",
    "page": "appDokter"
  },
  {
    "title": "Diagnosis",
    "desc": "Tulis diagnosis mengenai penyakit pasien anda",
    "image": "assets/medic.png",
    "page": "appointment"
  },
  {
    "title": "Medical Preception",
    "desc": "Berikan resep obat yang sesuai dengan diagnosis penyakit pasien",
    "image": "assets/medPre.png",
    "page": "diagnosis"
  },
  {
    "title": "Medical Records",
    "desc":
        "Ayo lakukan test demensia untuk mengetahui cara penanganan yang tepat..",
    "image": "assets/medRec.png",
    "page": "medicalrecords"
  },
];

class _HomePageDokterState extends State<HomePageDokter> {
  final DataBase db = DataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
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
                      FutureBuilder(
                        future: db.getUsn(),
                        builder: (context, snapshot) {
                          return Text(
                            'dr. ${db.name?.capitalizeFirst!}',
                            style: TextStyle(
                                fontSize: 18.sp, color: HexColor('#000000')),
                          );
                        },
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {
                      logout(context);
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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor("#F4F6FF"),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 20.w,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    color: Colors.white10.withOpacity(0.1),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.w,
                        );
                      },
                      itemCount: menu.length,
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
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 55.h,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(const HomePageDokter());
                      },
                      child: Icon(
                        Icons.home_rounded,
                        size: 28.w,
                        color: HexColor("#000000").withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(const LoginPage());
  }
}
