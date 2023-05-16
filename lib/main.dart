import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dokter/AppointmentDokter.dart';
import 'pasien/Appointment.dart';
import 'pasien/MedPre_Patient.dart';
import 'pasien/MedicalRecords.dart';
import 'pasien/diagnosis.dart';
import 'pasien/home_page.dart';
import 'login_page.dart';
import 'package:get/get.dart';
import 'register_page.dart';
import 'pasien/test_demensia.dart';
import 'pasien/resep_obat.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dokter/home_pageD.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => const LoginPage()),
            GetPage(name: '/home', page: () => const HomePage()),
            GetPage(name: '/homeDokter', page: () => const HomePageDokter()),
            GetPage(name: '/login', page: () => const LoginPage()),
            GetPage(name: '/register', page: () => const RegisterPage()),
            GetPage(name: '/appointment', page: () => const AppointmentPage()),
            GetPage(name: '/appDokter', page: () => const AppDokterPage()),
            GetPage(name: '/test_demensia', page: () => const TestDemen()),
            GetPage(name: '/diagnosis', page: () => const DiagnosisPage()),
            GetPage(
                name: '/medicalrecords',
                page: () => const MedicalRecordsPage()),
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
          theme: ThemeData(
              primarySwatch: Colors.green,
              textTheme: GoogleFonts.robotoCondensedTextTheme()),
        );
      },
    );
  }
}
