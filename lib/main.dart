import 'package:flutter/material.dart';
import 'package:tubes/Appointment.dart';
import 'package:tubes/first_page.dart';
import 'package:tubes/home_page.dart';
import 'package:tubes/login_page.dart';
import 'package:get/get.dart';
import 'package:tubes/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const AppointmentPage()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/appointment', page: () => const AppointmentPage()),
        // GetPage(name: '/second', page: () => LoginPage()),
      ],
      title: 'Tubes',
      theme:
          ThemeData(primarySwatch: Colors.green, fontFamily: 'RobotoCondensed'),
    );
  }
}
