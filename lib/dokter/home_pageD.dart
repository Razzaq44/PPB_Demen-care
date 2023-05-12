import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    "desc": "Tulis rekam medis setelah tindakan dilakukan",
    "image": "assets/diagnosis.png",
    "page": "medpre"
  },
];

class _HomePageDokterState extends State<HomePageDokter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor("#F4F6FF"),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Container(
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
                                "Hello dr. ",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: HexColor('#000000'),
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                "Carolina Terner",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: HexColor('#000000')),
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
              ),
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
                      onPressed: () {},
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 28.w,
                        color: HexColor("#000000").withOpacity(0.5),
                      ),
                    ),
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
                    TextButton(
                      onPressed: () {},
                      child: Icon(Icons.settings,
                          size: 28.w,
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
