import 'package:flutter/material.dart';
import 'package:flutter_innit/week06/exercise_10.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Exercise10(),
    );
  }
}
