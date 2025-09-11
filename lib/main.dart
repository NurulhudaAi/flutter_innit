import 'package:flutter/material.dart';
import 'package:flutter_innit/week04/calculator.dart';
import 'package:flutter_innit/week04/login.dart';
import 'package:flutter_innit/week05/design2_demo.dart';
import 'package:flutter_innit/week05/design_demo.dart';
import 'package:flutter_innit/week05/multi_child_demo.dart';
import 'package:flutter_innit/week05/randomNumber_demo.dart';
import 'package:flutter_innit/week05/single_child_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RandomNumber(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/calculator': (context) => const CalculatorPage(),
      },
    );
  }
}
