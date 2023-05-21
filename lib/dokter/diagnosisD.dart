import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../database/helper.dart';

class diagnosisDPage extends StatefulWidget {
  const diagnosisDPage({super.key});

  @override
  State<diagnosisDPage> createState() => _diagnosisDPageState();
}

List<Map<String, dynamic>> jadwal = [];

class _diagnosisDPageState extends State<diagnosisDPage> {
  List<Map<String, dynamic>> diagnosisData = [];
  _diagnosisDPageState(){}

  final DataBase db = DataBase();

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final CollectionReference _app =
      FirebaseFirestore.instance.collection('diagnosis');

  TextEditingController dateController1 = TextEditingController();
  TextEditingController dateController2 = TextEditingController();

  String? selectPasien;
  String? selectDatadiagnosis = "";

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
              Text(
                "Diagnosis",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: HexColor("#000000"),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightGreen,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 15.w,
              ),
              Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Tanggal')),
                    DataColumn(label: Text('Pasien')),
                    DataColumn(label: Text('Hari')),
                    DataColumn(label: Text('Data Diagnosis')),
                  ],
                  rows: diagnosisData.map<DataRow>((data) {
                    return DataRow(
                      cells: [
                        DataCell(Text(data['tanggal'])),
                        DataCell(Text(data['pasien'])),
                        DataCell(Text(data['hari'])),
                        DataCell(Text(data['datadiagnosis'])),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 15.w,
            ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 35.w),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: HexColor("#F4F6FF"),
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(40)),
                    ),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Make an Diagnosis",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          TextField(
                              controller: dateController1,
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
                            future: db.getPasienName(),
                            builder: (context, snapshot) {
                              return DropdownButtonFormField(
                                value: selectPasien,
                                items: db.pasienList.map<DropdownMenuItem>((data) {
                                  String username = data['username'] as String;
                                  return DropdownMenuItem(
                                    value: username,
                                    child: Text(username),
                                  );
                                }).toList(),
                                onChanged: (newVal) {
                                  setState(() {
                                    selectPasien = newVal as String;
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
                                    labelText: "Select Pasien",
                                    icon: const Icon(Icons.person),
                                    border: const UnderlineInputBorder()),
                              );
                            },
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              selectDatadiagnosis = value;
                            },
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                    color: HexColor("#000000")),
                                icon: const Icon(Icons.library_books),
                                labelText: "Data Diagnosis",
                                hintText: "Enter Data"),
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
                                            selectPasien.toString(),
                                            dateController2.text,
                                            selectDatadiagnosis.toString());
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
                  ),
                ),
              ),
              SizedBox(
                height: 15.w,
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
        )),
    );
  }

  Future<void> createApp(
      String tanggal, String pasien, String hari, String datadiagnosis) async {
    if (_formkey.currentState!.validate()) {
      try {
        String documentId = '$tanggal-$pasien';
        DocumentSnapshot snapshot = await _app.doc(documentId).get();
        if (snapshot.exists) {
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text(
                "Pasien $pasien sudah memiliki Data diagnosis",
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
          _app.doc(documentId).set({
            'tanggal': tanggal,
            'pasien': db.name,
            'hari': hari,
            'datadiagnosis': datadiagnosis
          });
          setState(() {
            diagnosisData.add({
              'tanggal': tanggal,
              'pasien': db.name,
              'hari': hari,
              'datadiagnosis': datadiagnosis
            });
          });
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text(
                "Berhasil menambahkan Data diagnosis",
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