import 'package:flutter/material.dart';
import 'package:flutter_innit/week01/calculator.dart';
import 'package:flutter_innit/week01/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {'/login': (context) => const LoginPage(),
      '/calculator': (context) => const CalculatorPage(),
      },
    );
  }
}
