import 'dart:async';
import 'package:flutter/material.dart';

class Exercise10 extends StatefulWidget {
  const Exercise10({super.key});

  @override
  State<Exercise10> createState() => _Exercise10State();
}

class _Exercise10State extends State<Exercise10> {
  Timer? _timer;
  int count = 100; // 100 == 1.00

  void startCountdown() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        count--;
        if (count <= 0) {
          count = 0; // aint to be minus once pressed start btn again
          timer.cancel();
        }
      });
    });
  }

  void resetCountdown() {
    _timer?.cancel();
    setState(() {
      count = 100; // reset to 1.00
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (count / 100).toStringAsFixed(2), //decimal 2 places
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: startCountdown,
                  icon: Icon(Icons.play_circle),
                  label: Text('Start'),
                ),
                SizedBox(width: 10),
                FilledButton.icon(
                  onPressed: resetCountdown,
                  icon: Icon(Icons.restart_alt_rounded),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  label: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
