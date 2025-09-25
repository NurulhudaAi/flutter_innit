import 'dart:math';
import 'package:flutter/material.dart';

class MockLabTest extends StatefulWidget {
  const MockLabTest({super.key});

  @override
  State<MockLabTest> createState() => _MockLabTestState();
}

class _MockLabTestState extends State<MockLabTest> {
  final TextEditingController _nameController = TextEditingController();
  final Map<String, int> _scores = {}; //เก็บค่าชื่อและคะแนน //  use Map<String, dynamic>
  final Random _random = Random();
  String _averageText = '';

  void _addScore() {
    String name = _nameController.text.trim();
    if (name.isEmpty) return;

    //double score = _random.nextDouble() * 100; 0.00-100.00
    int score = _random.nextInt(101); // 0–100
    setState(() {
      _scores[name] = score;
      _nameController.clear();
    });
  }

  void _showAverage() {
    if (_scores.isEmpty) return;
    double avg = _scores.values.reduce((a, b) => a + b) / _scores.length;
    setState(() {
      _averageText = 'Average Score: ${avg.toStringAsFixed(2)}';
    });
  }

  void _clearAll() {
    setState(() {
      _scores.clear();
      _averageText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Quiz Score Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Enter student name",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addScore,
                  child: const Text("Add Score"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: _scores.entries.map((entry) {
                  return ListTile(
                    title: Text(
                      "${entry.key} - ${entry.value}",
                      style: TextStyle(
                        color: entry.value >= 50 ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Text(_averageText, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _showAverage,
                  child: const Text("Show Average"),
                ),
                ElevatedButton(
                  onPressed: _clearAll,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Clear All"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
