import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../database/helper.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  _AppointmentPageState() {
    selectWaktu = waktuList[0];
  }

  final DataBase db = DataBase();

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final CollectionReference _app =
      FirebaseFirestore.instance.collection('appointment');

  TextEditingController dateController1 = TextEditingController();
  TextEditingController dateController2 = TextEditingController();

  String? selectDokter;
  String? selectWaktu = "";

  final waktuList = [
    "08:30",
    "09:30",
    "10:30",
    "11:30",
    "13:30",
    "14:30",
    "15:30"
  ];

  void clearText() {
    dateController1.clear();
  }

  @override
  void initState() {
    super.initState();
    dateController1.text = "";
  }

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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                              stream: db.getApprovedP(db.name),
                              builder: (context, snapshot) {
                                return ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: db.approvedP.length,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: HexColor("#F4F9F4"),
                                          image: DecorationImage(
                                              image: const AssetImage(
                                                  "assets/logo2.png"),
                                              colorFilter: ColorFilter.mode(
                                                  Colors.white.withOpacity(0.4),
                                                  BlendMode.modulate)),
                                          border: Border.all(
                                              width: 0.8,
                                              color: Colors.black12)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  "${db.approvedP[index]['tanggal']}",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Expanded(
                                                child: Container(),
                                              ),
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
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 11.sp),
                                                  ),
                                                  Text(
                                                    "${db.approvedP[index]["hari"]}",
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
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 11.sp),
                                                  ),
                                                  Text(
                                                    "${db.approvedP[index]["waktu"]}",
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
                                                    "Dokter",
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 11.sp),
                                                  ),
                                                  Text(
                                                    "${db.approvedP[index]["dokter"]}",
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
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35.w,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 35.w),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: HexColor("#F4F6FF"),
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(40))),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Make An Appointment",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 15.w,
                      ),
                      TextFormField(
                          controller: dateController1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Pilih tanggal terlebih dahulu";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  color: HexColor("#000000")),
                              icon: const Icon(Icons.calendar_today),
                              labelText: "Select Date"),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2023),
                                lastDate: DateTime(2024));
                            if (pickedDate != null) {
                              String formattedDate1 =
                                  DateFormat('d-MMMM-yyyy', 'id')
                                      .format(pickedDate);
                              String formattedDate2 =
                                  DateFormat('EEEE', 'id').format(pickedDate);
                              setState(() {
                                dateController1.text = formattedDate1;
                                dateController2.text = formattedDate2;
                              });
                            }
                          }),
                      SizedBox(
                        height: 15.w,
                      ),
                      FutureBuilder(
                        future: db.getDokterName(),
                        builder: (context, snapshot) {
                          return DropdownButtonFormField(
                            value: selectDokter,
                            items: db.dokterList.map<DropdownMenuItem>((data) {
                              String username = data['username'] as String;
                              return DropdownMenuItem(
                                value: username,
                                child: Text(username),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                selectDokter = newVal as String;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_outlined,
                            ),
                            validator: (value) {
                              if (value == null) {
                                return "Pilih dokter terlebih dahulu";
                              } else {
                                return null;
                              }
                            },
                            dropdownColor: HexColor("#FAF9FE"),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                    color: HexColor("#000000")),
                                labelText: "Select Doctor",
                                icon: const Icon(Icons.person),
                                border: const UnderlineInputBorder()),
                          );
                        },
                      ),
                      SizedBox(
                        height: 15.w,
                      ),
                      DropdownButtonFormField(
                        value: selectWaktu,
                        items: waktuList
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectWaktu = val as String;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down_outlined,
                        ),
                        dropdownColor: HexColor("#FAF9FE"),
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                color: HexColor("#000000")),
                            labelText: "Select Time",
                            icon: const Icon(Icons.alarm),
                            border: const UnderlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                clearText();
                              },
                              child: Container(
                                width: 80.w,
                                height: 30.w,
                                decoration: BoxDecoration(
                                    color: HexColor("#BDBDBD"),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: Center(
                                  child: Text(
                                    "Clear",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: HexColor("#FFFFFF")),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          FutureBuilder(
                            future: db.getUsn(),
                            builder: (context, snapshot) {
                              return InkWell(
                                  onTap: () {
                                    createApp(
                                        dateController1.text,
                                        selectDokter.toString(),
                                        dateController2.text,
                                        selectWaktu.toString());
                                    clearText();
                                  },
                                  child: Container(
                                    width: 80.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                        color: HexColor("#81B214"),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Center(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: HexColor("#FFFFFF")),
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
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
        ));
  }

  Future<void> createApp(
      String tanggal, String dokter, String hari, String waktu) async {
    if (_formkey.currentState!.validate()) {
      try {
        String documentId = '$tanggal-$dokter-$waktu';
        DocumentSnapshot snapshot = await _app.doc(documentId).get();
        if (snapshot.exists) {
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text(
                "Dokter $dokter telah memiliki jadwal pada tanggal atau waktu tersebut",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          var approve = "pending";
          _app.doc(documentId).set({
            'approved': approve,
            'pasien': db.name,
            'tanggal': tanggal,
            'dokter': dokter,
            'hari': hari,
            'waktu': waktu
          });
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text(
                "Succsess Menambahkan Appoinment",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } on FirebaseException catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Text(
              e.toString(),
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
}
