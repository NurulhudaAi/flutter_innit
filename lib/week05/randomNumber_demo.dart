import 'package:flutter/material.dart';
import 'dart:math';

class RandomNumber extends StatefulWidget {
  const RandomNumber({super.key});

  @override
  State<RandomNumber> createState() => _RandomNumberState();
}

class _RandomNumberState extends State<RandomNumber> {
  TextEditingController tcMin = TextEditingController();
  TextEditingController tcMax = TextEditingController();
  String result = '';

  void generateRandom() {
    int? min = int.tryParse(tcMin.text);
    int? max = int.tryParse(tcMax.text);
    if (min == null || max == null || min > max) {
      setState(() {
        result = 'Wrong input';
      });
      return;
    }
    int num = min + Random().nextInt(max - min + 1);
    setState(() {
      result = num.toString();
    });
  }

  void clear() {
    tcMin.clear();
    tcMax.clear();
    setState(() {
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Random Integer Number',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextField(
                controller: tcMin,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'min'),
              ),
              TextField(
                controller: tcMax,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'max'),
              ),
              const SizedBox(height: 12),
              Text(
                result,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(''),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: generateRandom,
                child: const Text('Generate'),
              ),
              const SizedBox(height: 8),
              FilledButton(onPressed: clear, child: const Text('Clear')),
            ],
          ),
        ),
      ),
    );
  }
}
