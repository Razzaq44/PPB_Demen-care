import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tubes/login_page.dart';

class TestDemen extends StatefulWidget {
  const TestDemen({super.key});

  @override
  State<TestDemen> createState() => _TestDemenState();
}

class _TestDemenState extends State<TestDemen> {
  final items = [
    ListItem(
      title: 'Soal nomer 1',
      description: 'blablablabla',
      selectedValue: 1,
    ),
    ListItem(
      title: 'Soal nomer 2',
      description: 'blablablabla',
      selectedValue: 1,
    ),
    ListItem(
      title: 'soal nomer 3',
      description: 'description',
      selectedValue: 1,
    ),
    ListItem(
      title: 'soal nomer 4',
      description: 'description',
      selectedValue: 1,
    ),
    ListItem(
      title: 'soal nomer 5',
      description: 'description',
      selectedValue: 1,
    ),
    ListItem(
      title: 'soal nomer 6',
      description: 'description',
      selectedValue: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Test Demensia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(item.title),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 1; i <= 5; i++)
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: i,
                              groupValue: item.selectedValue,
                              onChanged: (value) {
                                // Ketika radio button diubah
                                setState(() {
                                  item.selectedValue = value!;
                                });
                              },
                            ),
                            Text('$i'),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.all(40),
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Anda Belum Login!!'),
                    content: Text('Login sekarang?'),
                    actions: [
                      TextButton(
                        child: Text('Batal'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      ElevatedButton(
                        child: Text('Iya'),
                        onPressed: () {
                          Navigator.pop(context);
                          Get.to(const LoginPage());
                        },
                      )
                    ],
                  );
                });
          },
          child: Text('submit'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
      ),
    );
  }
}

class ListItem {
  final String title;
  final String description;
  int selectedValue; // Menyimpan nilai radio button yang dipilih

  ListItem({
    required this.title,
    required this.description,
    this.selectedValue = 1,
  });
}
