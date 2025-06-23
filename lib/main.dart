import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'providers/health_data_provider.dart';
import 'providers/medication_provider.dart';
import 'pages/health_log_page.dart';
import 'pages/medication_page.dart';
import 'pages/video_library_page.dart';
import 'pages/report_page.dart';

void main() {
  runApp(const InitialApp());
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});
  static const Color primaryColor = Color(0xFFF7931E);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HealthDataProvider()),
        ChangeNotifierProvider(create: (_) => MedicationProvider()),
      ],
      child: MaterialApp(
        title: 'เติมใจเติมสุข',
        theme: ThemeData(
          fontFamily: 'Sarabun',
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor),
        ),
        routes: {
          '/': (context) => const HomePage(),
          '/health-log': (context) => const HealthLogPage(),
          '/medication': (context) => const MedicationPage(),
          '/videos': (context) => VideoLibraryPage(),
          '/report': (context) => const ReportPage(),
        },
      ),
    );
  }
}
