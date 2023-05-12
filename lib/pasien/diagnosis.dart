import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home_page.dart';
//void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Diagnosis',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

class Diagnosis {
final String doctor;
final String patient;
final DateTime date;
final String diagnosis;

Diagnosis(this.doctor, this.patient, this.date, this.diagnosis);
}

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({super.key});

  @override
  State <DiagnosisPage> createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  List<Diagnosis> diagnoses = [];

  void addDiagnosis(Diagnosis diagnosis) {
    setState(() {
      diagnoses.add(diagnosis);
    });
  }

  void _showDialog() {
    String selectedDoctor = 'Dr. A';
    String selectedPatient = 'Patient A';
    DateTime selectedDate = DateTime.now();
    String diagnosisText = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Make Diagnosis'),
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
                items: <String>['Dr. A', 'Dr. B', 'Dr. C', 'Dr. D']
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
                items: <String>['Patient A', 'Patient B', 'Patient C', 'Patient D']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ListTile(
                title: Text('Date'),
                subtitle: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2025),
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
                  diagnosisText = text;
                },
                decoration: InputDecoration(
                  labelText: 'Diagnosis',
                  hintText: 'Enter the diagnosis',
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
              child: Text('Make Diagnosis'),
              onPressed: () {
                Diagnosis newDiagnosis = Diagnosis(
                  selectedDoctor,
                  selectedPatient,
                  selectedDate,
                  diagnosisText,
                );
                addDiagnosis(newDiagnosis);
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
        title: Text('Diagnosis'),
          ),
        body: ListView(
          children: [
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Doctor',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Patient',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Date',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Diagnosis',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: diagnoses.map((Diagnosis diagnosis) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text(diagnosis.doctor)),
                    DataCell(Text(diagnosis.patient)),
                    DataCell(Text('${diagnosis.date.day}/${diagnosis.date.month}/${diagnosis.date.year}')),
                    DataCell(Text(diagnosis.diagnosis)),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
        floatingActionButton: ElevatedButton(
        onPressed: _showDialog,
        child: Text('Make Diagnosis'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(),
          padding: EdgeInsets.all(16.0),
          primary: Color.fromARGB(244, 58, 177, 37),
        ),
      ),
    );
  }
}        
