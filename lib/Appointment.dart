import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes/home_page.dart';
import 'package:intl/intl.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

List<Map<String, dynamic>> jadwal = [
  {
    "hari": "Senin",
    "tanggal": "10-04-2023",
    "jam": "10.30",
    "dokter": "A",
    "id": "CRF"
  },
  {
    "hari": "Selasa",
    "tanggal": "11-04-2023",
    "jam": "10.30",
    "dokter": "C",
    "id": "KFC"
  },
  {
    "hari": "Rabu",
    "tanggal": "12-04-2023",
    "jam": "10.30",
    "dokter": "A",
    "id": "MCD"
  },
  {
    "hari": "Kamis",
    "tanggal": "13-04-2023",
    "jam": "10.30",
    "dokter": "D",
    "id": "AWS"
  },
];

class _AppointmentPageState extends State<AppointmentPage> {
  _AppointmentPageState() {
    selectDokter = dokterList[0];
    selectWaktu = waktuList[0];
  }

  TextEditingController dateController = TextEditingController();

  String? selectDokter = "";
  String? selectWaktu = "";

  final dokterList = ["A", "B", "C", "D", "E", "F"];

  final waktuList = [
    "08:30",
    "09:30",
    "10:30",
    "11:30",
    "13:30",
    "14:30",
    "15:30"
  ];

  void clearText() {
    dateController.clear();
  }

  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: HexColor("#FFFFFF"), //81B214
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height) / 3.5,
            padding:
                const EdgeInsets.only(right: 40, left: 40, top: 40, bottom: 20),
            decoration: BoxDecoration(
              color: HexColor("#FFFFFF"),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 18,
                      color: HexColor("#000000"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Your Appointment Schedule ",
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: jadwal.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 20,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(
                            top: 15, right: 20, left: 20, bottom: 5),
                        height: 70,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("#F4F9F4"),
                            image: DecorationImage(
                                image: const AssetImage("assets/logo2.png"),
                                colorFilter: ColorFilter.mode(
                                    Colors.white.withOpacity(0.4),
                                    BlendMode.modulate)),
                            border:
                                Border.all(width: 0.8, color: Colors.white10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: '${jadwal[index]["id"]} - ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                  TextSpan(text: "${jadwal[index]["tanggal"]}")
                                ])),
                            Expanded(child: Container()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hari",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "${jadwal[index]["hari"]}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Waktu",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "${jadwal[index]["jam"]}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dokter",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "${jadwal[index]["dokter"]}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding:
                const EdgeInsets.only(right: 40, left: 40, top: 30, bottom: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: HexColor("#F4F6FF"),
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(50))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Make An Appointment",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                    controller:
                        dateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Select Date" //label text of field
                        ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2024));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('EEEE, d - MMMM - yyyy', 'id')
                                .format(pickedDate);
                        setState(() {
                          dateController.text = formattedDate;
                        });
                      } else {
                        Get.snackbar('Date Has Not Selected Yet', 'alert');
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  value: selectDokter,
                  items: dokterList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectDokter = val as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                  ),
                  dropdownColor: HexColor("#FAF9FE"),
                  decoration: const InputDecoration(
                      labelText: "Select Doctor",
                      icon: Icon(Icons.person),
                      border: UnderlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  value: selectWaktu,
                  items: waktuList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectWaktu = val as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                  ),
                  dropdownColor: HexColor("#FAF9FE"),
                  decoration: const InputDecoration(
                      labelText: "Select Doctor",
                      icon: Icon(Icons.alarm),
                      border: UnderlineInputBorder()),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      // alignment: Alignment.topRight,
                      width: (MediaQuery.of(context).size.width) / 4,
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {
                            clearText();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey),
                          child: const Text(
                            "Clear",
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      // alignment: Alignment.topRight,
                      width: (MediaQuery.of(context).size.width) / 4,
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HexColor("#81B214")),
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                  ],
                )
              ],
            ),
          )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 32,
                    color: HexColor("#000000").withOpacity(0.5),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const HomePage());
                  },
                  child: Icon(
                    Icons.home_rounded,
                    size: 32,
                    color: HexColor("#000000").withOpacity(0.5),
                  ),
                  // child: Container(
                  //   width: 40,
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: AssetImage("assets/Logo.png"),
                  //           fit: BoxFit.cover)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Icon(Icons.settings,
                      size: 32, color: HexColor("#000000").withOpacity(0.5)),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
