import 'package:flutter/material.dart';
import 'dart:math' as math;

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String _result = '';
  Color _resultMessage = Colors.red;

  // func: to calculated
  void _calculate(String operation) {
    final String text1 = _controller1.text.trim();
    final String text2 = _controller2.text.trim();

    if (text1.isEmpty || text2.isEmpty) {
      setState(() {
        _result = 'Please input both numbers';
        _resultMessage = Colors.red;
      });
      return;
    }

    final double? num1 = double.tryParse(text1);
    final double? num2 = double.tryParse(text2);

    if (num1 == null || num2 == null) {
      setState(() {
        _result = 'Please input only numbers';
        _resultMessage = Colors.red;
      });
      return;
    }

    double result = 0;
    switch (operation) {
      case '+':
        result = num1 + num2;
        break;
      case '^':
        result = math.pow(num1, num2).toDouble();
        break;
    }

    setState(() {
      _resultMessage = Colors.red;
      if (result == result.toInt()) {
        _result = 'Result = ${result.toInt()}';
      } else {
        _result = 'Result = ${result.toInt()}';
      }
    });
  }

  void _clear() {
    setState(() {
      _controller1.clear();
      _controller2.clear();
      _result = '';
      _resultMessage = Colors.red;
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(labelText: 'Number 1'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(labelText: 'Number 2'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text(
                    'Sum',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => _calculate('^'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    'Power',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: _clear,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: const Text('Clear', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            Text(
              _result,
              style: TextStyle(color: _resultMessage, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
