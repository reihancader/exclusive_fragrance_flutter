// ignore_for_file: prefer_const_constructors
import 'package:exclusive_fragrance/screens/login_and_register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF151E25), // Background color
      ),
      home: LoginRegisterScreen(),
    );
  }
}
