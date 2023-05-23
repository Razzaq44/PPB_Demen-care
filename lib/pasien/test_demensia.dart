import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../database/helper.dart';

class TestDemen extends StatefulWidget {
  const TestDemen({Key? key}) : super(key: key);

  @override
  State<TestDemen> createState() => _TestDemenState();
}

class _TestDemenState extends State<TestDemen> {
  final DataBase db = DataBase();

  final _auth = FirebaseAuth.instance;

  final CollectionReference _app =
      FirebaseFirestore.instance.collection('testdemensia');

  final jawaban = [
    0,
    1,
  ];

  List<String> questions = [
    "Apakah pasien merasa sering lupa?(ya/tidak)",
    "Apakah pasien sering melakukan kegiatan berulang walaupun sudah mengerjakannya?(ya/tidak)",
    "Apakah pasien merasa letih ketika duduk dalam posisi yang lama?(ya/tidak)",
    "Apakah pasien juga merasa lemas ketika hanya berbaring saja?(ya/tidak)",
    "Apakah pasien juga sering merasa linglung ketika melakukan kegiatan sehari-hari?(ya/tidak)"
    // ... tambahkan pertanyaan lainnya sesuai kebutuhan
  ];
  late List<TextEditingController> answerControllers;
  late List<int?> selectjawaban;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller untuk setiap pertanyaan
    answerControllers = List.generate(
      questions.length,
      (index) => TextEditingController(),
    );
    selectjawaban = List.generate(questions.length, (index) => null);
  }

  @override
  void dispose() {
    // Hapus controller ketika tidak lagi diperlukan
    for (final controller in answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "TEST DEMENSIA",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(15),
                color: HexColor("#000000"),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(5),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Warna latar belakang
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(10)), // Sudut melengkung pada border
              ),
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                child: Text(
                  "Petunjuk: 0 = Tidak, 1 = Ya",
                  style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(5)),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              questions[index],
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(8)),
                            child: DropdownButtonFormField(
                              value: selectjawaban[index],
                              items: jawaban
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text('$e'),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  selectjawaban[index] = val as int;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down_outlined,
                              ),
                              dropdownColor: HexColor("#FAF9FE"),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  fontWeight: FontWeight.w300,
                                  color: HexColor("#000000"),
                                ),
                                labelText: "Select jawaban",
                                border: const UnderlineInputBorder(),
                              ),
                            ),
                          ),
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
      floatingActionButton: Row(
        children: [
          SizedBox(width: 160.w),
          ElevatedButton(
            onPressed: () async {
              for (int i = 0; i < 5; i++) {
                data.add(selectjawaban[i]);
              }

              // Periksa apakah semua jawaban telah terisi
              bool isAllAnswered = true;
              for (int? jawaban in selectjawaban) {
                if (jawaban == null) {
                  isAllAnswered = false;
                  break;
                }
              }

              if (isAllAnswered) {
                int sum = 0;
                for (int i = 0; i < 5; i++) {
                  sum = (selectjawaban[i] ?? 0) + sum;
                }

                String result = sum < 3
                    ? 'Tidak menderita demensia'
                    : 'Anda menderita demensia';

                await createApp(
                    selectjawaban[0],
                    selectjawaban[1],
                    selectjawaban[2],
                    selectjawaban[3],
                    selectjawaban[4],
                    result);
                hasil(context);
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Text(
                      "Mohon isi semua jawaban!",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.w400,
                      ),
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
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.lightGreen, // Warna latar belakang tombol
            ),
            child: Text(
              'Submit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<int?> data = [];

  Future<void> createApp(int? soal1, int? soal2, int? soal3, int? soal4,
      int? soal5, String result) async {
    var user = _auth.currentUser;
    _app.doc(user?.uid).set({
      'soal1': soal1,
      'soal2': soal2,
      'soal3': soal3,
      'soal4': soal4,
      'soal5': soal5,
      'result': result,
    });
  }

  void hasil(BuildContext context) {
    int sum = 0;
    for (int i = 0; i < 5; i++) {
      sum = (selectjawaban[i] ?? 0) + sum;
    }

    String result =
        sum < 3 ? 'Tidak menderita demensia' : 'Anda menderita demensia';

    createApp(selectjawaban[0], selectjawaban[1], selectjawaban[2],
        selectjawaban[3], selectjawaban[4], result);

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text(
          result,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
            fontWeight: FontWeight.w400,
          ),
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
