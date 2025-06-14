import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const InitialApp());
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});
  static const Color primaryColor = Color(0xFFF7931E);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'เติมใจเติมสุข',
      theme: ThemeData(
        fontFamily: 'Sarabun',
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor),
      ),
      home: HomePage(),
    );
  }
}
