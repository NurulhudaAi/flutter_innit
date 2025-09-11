import 'package:flutter/material.dart';

class DesignDemo extends StatefulWidget {
  const DesignDemo({super.key});

  @override
  State<DesignDemo> createState() => _DesignDemoState();
}

class _DesignDemoState extends State<DesignDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(color: Colors.red, width: 100, height: 100),
          Expanded(
            child: Container(
              color: Colors.teal,
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(color: Colors.yellow, width: 100, height: 100),
                  Container(color: Colors.green, width: 100, height: 100),
                ],
              ),
            ),
          ),

          Container(color: Colors.blue, width: 100, height: 100),
        ],
      ),
    );
  }
}
