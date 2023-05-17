import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../database/helper.dart';

class AppDokterPage extends StatefulWidget {
  const AppDokterPage({super.key});

  @override
  State<AppDokterPage> createState() => _AppDokterPageState();
}

final CollectionReference _app =
    FirebaseFirestore.instance.collection('appointment');
final DataBase db = DataBase();

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
                    child: FutureBuilder(
                      future: db.getUsn(),
                      builder: (context, snapshot) {
                        return StreamBuilder(
                          stream: db.getApproved(db.name),
                          builder: (context, snapshot) {
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: db.approved.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 20.w,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 15.h,
                                      right: 10.w,
                                      left: 10.w,
                                      bottom: 5.h),
                                  height: 100.w,
                                  width: 160.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: HexColor("#F4F9F4"),
                                      image: DecorationImage(
                                          image: const AssetImage(
                                              "assets/logo2.png"),
                                          colorFilter: ColorFilter.mode(
                                              Colors.white.withOpacity(0.4),
                                              BlendMode.modulate)),
                                      border: Border.all(
                                          width: 0.8, color: Colors.black12)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            db.approved[index]['tanggal'],
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          InkWell(
                                            child: Container(
                                              width: 30.w,
                                              height: 15.h,
                                              decoration: BoxDecoration(
                                                  color: HexColor("#81B214"),
                                                  borderRadius:
                                                      const BorderRadius.all(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Hari",
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11.sp),
                                              ),
                                              Text(
                                                "${db.approved[index]["hari"]}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11.sp),
                                              ),
                                              Text(
                                                "${db.approved[index]["waktu"]}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Pasien",
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11.sp),
                                              ),
                                              Text(
                                                "${db.approved[index]["pasien"]}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
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
                        "Approve An Appointment Schedule",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future: db.getUsn(),
                          builder: (context, snapshot) {
                            return StreamBuilder(
                              stream: db.getNeedApprove(db.name),
                              builder: (context, snapshot) {
                                return ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 20.h,
                                    );
                                  },
                                  itemCount: db.needApprove.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 90.w,
                                      width: 315.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: HexColor("#F4F9F4"),
                                          image: DecorationImage(
                                              image: const AssetImage(
                                                  "assets/card.png"),
                                              colorFilter: ColorFilter.mode(
                                                  Colors.white.withOpacity(0.4),
                                                  BlendMode.modulate),
                                              fit: BoxFit.fitWidth),
                                          border: Border.all(
                                              width: 0.8,
                                              color: Colors.black12)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.w,
                                                top: 10.w,
                                                right: 15.w),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Pasien",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: HexColor("#000000")
                                                          .withOpacity(0.5)),
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Text(
                                                  "${db.needApprove[index]['pasien']}",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          HexColor("#000000")),
                                                ),
                                                Expanded(child: Container()),
                                                Text(
                                                  "${db.needApprove[index]["tanggal"]}",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: HexColor("#000000")
                                                          .withOpacity(0.7)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.w,
                                                top: 10.w,
                                                right: 15.w),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Waktu",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: HexColor("#000000")
                                                          .withOpacity(0.5)),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  "${db.needApprove[index]["waktu"]}",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          HexColor("#000000")),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.w,
                                                top: 8.w,
                                                right: 15.w),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Hari",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: HexColor("#000000")
                                                          .withOpacity(0.5)),
                                                ),
                                                SizedBox(
                                                  width: 27.w,
                                                ),
                                                Text(
                                                  "${db.needApprove[index]["hari"]}",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          HexColor("#000000")),
                                                ),
                                                Expanded(child: Container()),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          var approve =
                                                              "decline";
                                                          declineApp(
                                                              db.needApprove[
                                                                      index]
                                                                  ['dokter'],
                                                              db.needApprove[
                                                                      index]
                                                                  ['hari'],
                                                              db.needApprove[
                                                                      index]
                                                                  ['pasien'],
                                                              db.needApprove[
                                                                      index]
                                                                  ['tanggal'],
                                                              db.needApprove[
                                                                      index]
                                                                  ['waktu'],
                                                              approve);
                                                        },
                                                        child: Container(
                                                          width: 50.w,
                                                          height: 20.w,
                                                          decoration: BoxDecoration(
                                                              color: HexColor(
                                                                  "#C0C0C0"),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          8))),
                                                          child: Center(
                                                            child: Text(
                                                              "Decline",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: HexColor(
                                                                      "#FFFFFF")),
                                                            ),
                                                          ),
                                                        )),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          var approve =
                                                              "approve";
                                                          approveApp(
                                                              db.needApprove[
                                                                      index]
                                                                  ['dokter'],
                                                              db.needApprove[
                                                                      index]
                                                                  ['hari'],
                                                              db.needApprove[
                                                                      index]
                                                                  ['pasien'],
                                                              db.needApprove[
                                                                      index]
                                                                  ['tanggal'],
                                                              db.needApprove[
                                                                      index]
                                                                  ['waktu'],
                                                              approve);
                                                        },
                                                        child: Container(
                                                          width: 50.w,
                                                          height: 20.w,
                                                          decoration: BoxDecoration(
                                                              color: HexColor(
                                                                  "#81B214"),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          8))),
                                                          child: Center(
                                                            child: Text(
                                                              "Approved",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: HexColor(
                                                                      "#FFFFFF")),
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
                                );
                              },
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
                    onPressed: () {
                      Get.back();
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
      ),
    );
  }

  Future<void> approveApp(String dokter, String hari, String pasien,
      String tanggal, String waktu, String approve) async {
    String documentId = '$tanggal-$dokter-$waktu';
    DocumentSnapshot snapshot = await _app.doc(documentId).get();
    _app.doc(documentId).set({
      'dokter': dokter,
      'hari': hari,
      'pasien': pasien,
      'tanggal': tanggal,
      'waktu': waktu,
      'approved': approve
    });
  }

  Future<void> declineApp(String dokter, String hari, String pasien,
      String tanggal, String waktu, String approve) async {
    String documentId = '$tanggal-$dokter-$waktu';
    DocumentSnapshot snapshot = await _app.doc(documentId).get();
    _app.doc(documentId).delete();
  }
}
