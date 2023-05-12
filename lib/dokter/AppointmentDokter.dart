import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home_pageD.dart';

class AppDokterPage extends StatefulWidget {
  const AppDokterPage({super.key});

  @override
  State<AppDokterPage> createState() => _AppDokterPageState();
}

List<Map<String, dynamic>> jadwal = [
  {
    "hari": "Senin",
    "tanggal": "10-04-2023",
    "jam": "10.30",
    "dokter": "A",
    "id": "CRF"
  },
  {
    "hari": "Selasa",
    "tanggal": "11-04-2023",
    "jam": "10.30",
    "dokter": "C",
    "id": "KFC"
  },
  {
    "hari": "Rabu",
    "tanggal": "12-04-2023",
    "jam": "10.30",
    "dokter": "A",
    "id": "MCD"
  },
  {
    "hari": "Kamis",
    "tanggal": "13-04-2023",
    "jam": "10.30",
    "dokter": "D",
    "id": "AWS"
  },
];

List<Map<String, dynamic>> approve = [
  {
    "pasien": "Terner",
    "waktu": "12:30",
    "hari": "Kamis",
    "tanggal": "13-04-2023"
  },
  {
    "pasien": "Caron",
    "waktu": "13:30",
    "hari": "Kamis",
    "tanggal": "13-04-2023"
  },
  {
    "pasien": "Lina",
    "waktu": "14:30",
    "hari": "Kamis",
    "tanggal": "13-04-2023"
  },
  {
    "pasien": "Luna",
    "waktu": "15:30",
    "hari": "Kamis",
    "tanggal": "13-04-2023"
  },
];

class _AppDokterPageState extends State<AppDokterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.calendar_month_outlined,
              size: 20.w,
              color: HexColor("#000000"),
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              "Your Appointment Schedule ",
              style: TextStyle(
                  fontSize: 15.sp,
                  color: HexColor("#000000"),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 30.w,
                left: 30.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.w,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: jadwal.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 20.w,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: 15.h, right: 10.w, left: 10.w, bottom: 5.h),
                          height: 100.w,
                          width: 160.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: HexColor("#F4F9F4"),
                              image: DecorationImage(
                                  image: const AssetImage("assets/logo2.png"),
                                  colorFilter: ColorFilter.mode(
                                      Colors.white.withOpacity(0.4),
                                      BlendMode.modulate)),
                              border: Border.all(
                                  width: 0.8, color: Colors.black12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: '${jadwal[index]["id"]}-',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.sp),
                                          children: <TextSpan>[
                                        TextSpan(
                                            text: "${jadwal[index]["tanggal"]}")
                                      ])),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: 30.w,
                                      height: 15.h,
                                      decoration: BoxDecoration(
                                          color: HexColor("#81B214"),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Center(
                                        child: Icon(
                                          Icons.done,
                                          size: 12.h,
                                          color: HexColor("#FFFFFF"),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(child: Container()),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Hari",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11.sp),
                                      ),
                                      Text(
                                        "${jadwal[index]["hari"]}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Waktu",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11.sp),
                                      ),
                                      Text(
                                        "${jadwal[index]["jam"]}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Dokter",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11.sp),
                                      ),
                                      Text(
                                        "${jadwal[index]["dokter"]}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: HexColor("#F4F6FF"),
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(40))),
                child: Padding(
                  padding: EdgeInsets.only(right: 30.w, left: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Select An Appointment Schedule",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                          itemCount: approve.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 90.w,
                              width: 315.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor("#F4F9F4"),
                                  image: DecorationImage(
                                      image:
                                          const AssetImage("assets/card.png"),
                                      colorFilter: ColorFilter.mode(
                                          Colors.white.withOpacity(0.4),
                                          BlendMode.modulate),
                                      fit: BoxFit.fitWidth),
                                  border: Border.all(
                                      width: 0.8, color: Colors.black12)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w, top: 10.w, right: 15.w),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Pasien",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor("#000000")
                                                  .withOpacity(0.5)),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Text(
                                          "${approve[index]["pasien"]}",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor("#000000")),
                                        ),
                                        Expanded(child: Container()),
                                        Text(
                                          "${approve[index]["tanggal"]}",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor("#000000")
                                                  .withOpacity(0.7)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w, top: 10.w, right: 15.w),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Waktu",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor("#000000")
                                                  .withOpacity(0.5)),
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Text(
                                          "${approve[index]["waktu"]}",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor("#000000")),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w, top: 8.w, right: 15.w),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Hari",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor("#000000")
                                                  .withOpacity(0.5)),
                                        ),
                                        SizedBox(
                                          width: 27.w,
                                        ),
                                        Text(
                                          "${approve[index]["hari"]}",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor("#000000")),
                                        ),
                                        Expanded(child: Container()),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                                child: Container(
                                              width: 50.w,
                                              height: 20.w,
                                              decoration: BoxDecoration(
                                                  color: HexColor("#C0C0C0"),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8))),
                                              child: Center(
                                                child: Text(
                                                  "Decline",
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          HexColor("#FFFFFF")),
                                                ),
                                              ),
                                            )),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            InkWell(
                                                child: Container(
                                              width: 50.w,
                                              height: 20.w,
                                              decoration: BoxDecoration(
                                                  color: HexColor("#81B214"),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8))),
                                              child: Center(
                                                child: Text(
                                                  "Approve",
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          HexColor("#FFFFFF")),
                                                ),
                                              ),
                                            )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
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
                      color: HexColor("#000000").withOpacity(0.5),
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
      ),
    );
  }
}
