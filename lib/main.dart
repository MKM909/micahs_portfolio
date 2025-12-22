import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:micahs_portfolio/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Micah's Portfolio",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
