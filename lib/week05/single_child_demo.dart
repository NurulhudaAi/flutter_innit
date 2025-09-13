import 'package:flutter/material.dart';

class SingleChildDemo extends StatefulWidget {
  const SingleChildDemo({super.key});

  @override
  State<SingleChildDemo> createState() => _SingleChildDemoState();
}

class _SingleChildDemoState extends State<SingleChildDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Align is (x,y) -1<=x<=1, -1<=y<=1 & (0,0) is at the parent's center
        child: Align(
          alignment: Alignment(-0.75, -1),
          child: Text('Single child'),
        ),
      ),
    );
  }
}
