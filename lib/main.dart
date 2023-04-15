import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tubes/Appointment.dart';
import 'package:tubes/MedPre_Patient.dart';
import 'package:tubes/MedicalRecords.dart';
import 'package:tubes/diagnosis.dart';
import 'package:tubes/home_page.dart';
import 'package:tubes/login_page.dart';
import 'package:get/get.dart';
import 'package:tubes/register_page.dart';
import 'package:tubes/test_demensia.dart';
import 'package:tubes/resep_obat.dart';

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
        GetPage(name: '/', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/appointment', page: () => const AppointmentPage()),
        GetPage(name: '/test_demensia', page: () => const TestDemen())
        // GetPage(name: '/second', page: () => LoginPage()),

        GetPage(name: '/diagnosis', page: () => const DiagnosisPage()),
        GetPage(
            name: '/medicalrecords', page: () => const MedicalRecordsPage()),
        GetPage(name: '/medicine', page: () => const ResepObatPage()),
        GetPage(name: '/medpre', page: () => const MedPrePage()),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('id'), // Indonesia
      ],
      title: 'Tubes',
      theme:
          ThemeData(primarySwatch: Colors.green, fontFamily: 'RobotoCondensed'),
    );
  }
}
