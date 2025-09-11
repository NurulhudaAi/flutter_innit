import 'package:flutter/material.dart';

class MultiChildDemo extends StatefulWidget {
  const MultiChildDemo({super.key});

  @override
  State<MultiChildDemo> createState() => _MultiChildDemoState();
}

class _MultiChildDemoState extends State<MultiChildDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(color: Colors.green, width: 100, height: 100),
            Spacer(flex: 3),
            Container(color: Colors.yellow, width: 100, height: 150),
            Spacer(flex: 2),
            Container(color: Colors.red, width: 100, height: 100),
          ],
        ),
      ),
    );
  }
}
