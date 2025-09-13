import 'package:flutter/material.dart';

class SumApp extends StatefulWidget {
  const SumApp({super.key});

  @override
  State<SumApp> createState() => _SumAppState();
}

class _SumAppState extends State<SumApp> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  String _result = "";

  void _calculate() {
    final n1 = int.tryParse(_num1Controller.text);
    final n2 = int.tryParse(_num2Controller.text);

    if (n1 == null || n2 == null) {
      setState(() {
        _result = 'Incorrect input';
      });
      return;
    } else {
      final num = n1 + n2;
      setState(() {
        _result = 'Result = $num';
      });
    }
  }

  void _clear() {
    _num1Controller.clear();
    _num2Controller.clear();
    setState(() {
      _result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _num1Controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'First Number',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text("+", style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _num2Controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Second Number',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: _calculate,
                    style: FilledButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text("Calculate"),
                  ),
                  const SizedBox(width: 10),
                  FilledButton(
                    onPressed: _clear,
                    style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text("Clear"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                _result,
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
