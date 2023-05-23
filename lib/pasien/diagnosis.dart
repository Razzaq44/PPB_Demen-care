import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tubes/database/helper.dart';

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({Key? key}) : super(key: key);

  @override
  State<DiagnosisPage> createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  List<Map<String, dynamic>> diagnosisData = [];
  final User? currentUser = FirebaseAuth.instance.currentUser;
  final DataBase db = DataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnosis'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: FutureBuilder(
                    future: db.getUsn(),
                    builder: (context, snapshot) {
                      return
                      StreamBuilder(
                      stream: db.getDiagnosis(db.name),
                      builder: (context, snapshot) {
                        return DataTable(
                          columns: const [
                            DataColumn(label: Text('Tanggal')),
                            DataColumn(label: Text('Pasien')),
                            DataColumn(label: Text('Hari')),
                            DataColumn(label: Text('Data Diagnosis')),
                          ],
                          rows: db.diagnosisList.map<DataRow>((data) {
                            return DataRow(
                              cells: [
                                DataCell(Text(data['tanggal'].toString())),
                                DataCell(Text(data['pasien'].toString())),
                                DataCell(Text(data['hari'].toString())),
                                DataCell(Text(data['datadiagnosis'].toString())),
                              ],
                            );
                          }).toList(),
                        );
                      }
                    );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final String currentUserEmail = currentUser?.email ?? '';
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('diagnosis')
          .where('pasien', isEqualTo: currentUserEmail)
          .get();

      if (snapshot.docs.isNotEmpty) {
        setState(() {
          diagnosisData = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
        });
      }
    } catch (e) {
      // Handle error
      print(e);
    }
  }
}
