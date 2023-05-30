import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../database/helper.dart';

class ResepObatPage extends StatefulWidget {
  const ResepObatPage({super.key});

  @override
  State<ResepObatPage> createState() => _ResepObatPageState();
}

class _ResepObatPageState extends State<ResepObatPage> {
  final DataBase db = DataBase();

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final CollectionReference _resepobat =
      FirebaseFirestore.instance.collection('resepobat');

  TextEditingController namaobat = TextEditingController();
  TextEditingController rules = TextEditingController();
  TextEditingController note = TextEditingController();

  String? selectPasien;

  void clearText() {
    namaobat.clear();
    rules.clear();
    note.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Row(
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 20.w,
                color: HexColor("#000000"),
              ),
              SizedBox(
                width: 12.w,
              ),
              Text(
                "Create Prescription",
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
                        "Make A Prescription",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 15.w,
                      ),
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
                            validator: (value) {
                              if (value == null) {
                                return "Pilih pasien terlebih dahulu";
                              } else {
                                return null;
                              }
                            },
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
                        height: 20.w,
                      ),
                      TextFormField(
                          controller: namaobat,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Medicine name cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Medicine name',
                          )),
                      SizedBox(
                        height: 20.w,
                      ),
                      TextFormField(
                          controller: rules,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Rules cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Rules',
                          )),
                      SizedBox(
                        height: 20.w,
                      ),
                      TextFormField(
                          controller: note,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Notes cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Notes',
                          )),
                      SizedBox(
                        height: 20.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FutureBuilder(
                            future: db.getUsn(),
                            builder: (context, snapshot) {
                              return InkWell(
                                  onTap: () {
                                    createObat(
                                      db.name,
                                      selectPasien.toString(),
                                      namaobat.text,
                                      rules.text,
                                      note.text,
                                    );
                                    clearText();
                                  },
                                  child: Container(
                                    width: 300.w,
                                    height: 40.w,
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
                          SizedBox(
                            height: 20.w,
                          ),
                          InkWell(
                              onTap: () {
                                clearText();
                              },
                              child: Container(
                                width: 300.w,
                                height: 40.w,
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

  Future<void> createObat(String? dokter, String pasien, String namaobat,
      String rules, String note) async {
    if (_formkey.currentState!.validate()) {
      try {
        String documentId = '$pasien-$namaobat';
        DocumentSnapshot snapshot = await _resepobat.doc(documentId).get();
        if (snapshot.exists) {
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text(
                "Pasien $pasien telah memiliki resep obat yang sama",
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
          _resepobat.doc(documentId).set({
            'pasien': pasien,
            'namaobat': namaobat,
            'dokter': dokter,
            'rules': rules,
            'note': note
          });
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text(
                "Succsess Menambahkan Resep Obat",
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
