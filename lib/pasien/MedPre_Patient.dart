import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tubes/database/helper.dart';

class MedPrePage extends StatefulWidget {
  const MedPrePage({Key? key}) : super(key: key);

  @override
  State<MedPrePage> createState() => _MedPrePageState();
}

class _MedPrePageState extends State<MedPrePage> {
  List<Map<String, dynamic>> MedPreData = [];
  final User? currentUser = FirebaseAuth.instance.currentUser;
  final DataBase db = DataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Prescription'),
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
                      stream: db.getresepObat(db.name),
                      builder: (context, snapshot) {
                        return DataTable(
                          columns: const [
                            DataColumn(label: Text('Dokter')),
                            DataColumn(label: Text('Nama Obat')),
                            DataColumn(label: Text('Note')),
                            DataColumn(label: Text('Pasien')),
                            DataColumn(label: Text('Rules')),
                          ],
                          rows: db.resepObatList.map<DataRow>((data) {
                            return DataRow(
                              cells: [
                                DataCell(Text(data['dokter'].toString())),
                                DataCell(Text(data['namaobat'].toString())),
                                DataCell(Text(data['note'].toString())),
                                DataCell(Text(data['pasien'].toString())),
                                DataCell(Text(data['rules'].toString())),
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
          .collection('MedPre_Patient')
          .where('pasien', isEqualTo: currentUserEmail)
          .get();

      if (snapshot.docs.isNotEmpty) {
        setState(() {
          MedPreData = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
        });
      }
    } catch (e) {
      // Handle error
      print(e);
    }
  }
}