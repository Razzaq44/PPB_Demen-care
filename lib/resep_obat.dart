import 'package:flutter/material.dart';

class ResepObatPage extends StatefulWidget {
  const ResepObatPage({super.key});

  @override
  State<ResepObatPage> createState() => _ResepObatPageState();
}

class _ResepObatPageState extends State<ResepObatPage> {
  List<String> values = [
    'assets/donepezil.png',
    'assets/galantamin.png',
    'assets/memantin.png',
    'assets/rivastigmin.png'
  ];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resep Obat'),
      ),
      body: Container(
        child: GridView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              child: Center(
                child: Image.asset(values[index]),
              ),
            );
          },
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
      ),
    );
  }
}
