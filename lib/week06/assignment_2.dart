import 'dart:async';
import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2> {
  Timer? _timer;
  int timeCountdown = 100;
  bool isRunning = false;
  int _clickCount = 0;

  void playButton() {
    _timer?.cancel();
    setState(() {
      timeCountdown = 100;
      _clickCount = 0;
      isRunning = true;
    });

    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        timeCountdown--;
        if (timeCountdown <= 0) {
          timeCountdown = 0;
          isRunning = false;
          _timer?.cancel();
        }
      });
    });
  }

  void clickButton() {
    if (isRunning) {
      setState(() {
        _clickCount++;
      });
    }
  }

  void reset() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (timeCountdown / 100).toStringAsFixed(2),
              style: TextStyle(color: Colors.red),
            ),
            Column(
              children: [
                Text(
                  'Click = $_clickCount',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton.icon(
                      onPressed: clickButton,
                      icon: Icon(Icons.touch_app, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      label: Text('Click'),
                    ),
                    SizedBox(width: 15),
                    OutlinedButton.icon(
                      onPressed: playButton,
                      icon: Icon(Icons.refresh_outlined, color: Colors.black),
                      label: Text('Play', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
