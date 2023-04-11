import 'package:flutter/material.dart';

class MedicalRecords {
  final String doctor;
  final String patient;
  final DateTime date;
  final String medrec;

  MedicalRecords(this.doctor, this.patient, this.date, this.medrec);
}

class MedicalRecordsPage extends StatefulWidget {
  const MedicalRecordsPage({super.key});

  @override
  State<MedicalRecordsPage> createState() => _MedicalRecordsPageState();
}

class _MedicalRecordsPageState extends State<MedicalRecordsPage> {
  List<MedicalRecords> medrecord = [];

  void addMedicalRecords(MedicalRecords medrec) {
    setState(() {
      medrecord.add(medrec);
    });
  }

  void _showDialog() {
    String selectedDoctor = '';
    String selectedPatient = '';
    DateTime selectedDate = DateTime.now();
    String medrecText = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Make Medical Records'),
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: selectedDoctor,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDoctor = newValue!;
                  });
                },
                items: <String>['A', 'B', 'C', 'D']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: selectedPatient,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPatient = newValue!;
                  });
                },
                items: <String>['1', '2', '3', '4']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ListTile(
                title: Text('Date'),
                subtitle: Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
              ),
              TextField(
                onChanged: (text) {
                  medrecText = text;
                },
                decoration: InputDecoration(
                  labelText: 'Medical Records',
                  hintText: 'Enter data',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Make Medical Records'),
              onPressed: () {
                MedicalRecords newMedRec = MedicalRecords(
                  selectedDoctor,
                  selectedPatient,
                  selectedDate,
                  medrecText,
                );
                addMedicalRecords(newMedRec);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Records'),
        titleTextStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Doctor',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              DataColumn(
                label: Text(
                  'Patient',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              DataColumn(
                label: Text(
                  'Date',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              DataColumn(
                label: Text(
                  'Medical Records Data',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ],
            rows: medrecord.map((MedicalRecords medrec) {
              return DataRow(
                cells: <DataCell>[
                  DataCell(Text(medrec.doctor)),
                  DataCell(Text(medrec.patient)),
                  DataCell(Text(
                      '${medrec.date.day}/${medrec.date.month}/${medrec.date.year}')),
                  DataCell(Text(medrec.medrec)),
                ],
              );
            }).toList(),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: _showDialog,
        child: Text('Make Medical Records'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          padding: EdgeInsets.all(18.0),
        ),
      ),
    );
  }
}
