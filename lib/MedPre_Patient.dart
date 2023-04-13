import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Prescription For Patient',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Medical Prescription For Patient'),
        ),
        body: Center(
          child: DataTable(
            dataRowColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.08)
                  : Colors.grey.shade50,
            ),
            dataRowHeight: 70.0,
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => Color.fromARGB(255, 57, 253, 64),
            ),
            headingRowHeight: 80.0,
            dividerThickness: 2.0,
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'ID',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Nama Pasien',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Obat',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Dosis',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Aturan Pakai',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('123')),
                  DataCell(Text('Budi')),
                  DataCell(Text('Paracetamol')),
                  DataCell(Text('500 mg')),
                  DataCell(Text('3x sehari setelah makan')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
