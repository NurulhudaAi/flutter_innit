import 'dart:math';
import 'package:flutter/material.dart';

class GuessWordGame extends StatefulWidget {
  const GuessWordGame({super.key});

  @override
  State<GuessWordGame> createState() => _GuessWordGameState();
}

class _GuessWordGameState extends State<GuessWordGame> {
  final TextEditingController _controller = TextEditingController();

  final List<String> _words = ["apple", "banana", "mango", "grape", "orange"];
  late String _targetWord;
  String _message = "";
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    _pickRandomWord();
  }

  void _pickRandomWord() {
    final random = Random();
    //random
    _targetWord = _words[random.nextInt(_words.length)];
    _message = "";
    _gameOver = false;
    _controller.clear();
  }

  void _checkGuess() {
    String guess = _controller.text.trim().toLowerCase();
    setState(() {
      if (guess == _targetWord) {
        _message = "✅ Correct! The word was $_targetWord.";
        _gameOver = true;
      } else {
        _message = "❌ Wrong, try again!";
      }
      _controller.clear();
    });
  }

  void _replay() {
    setState(() {
      _pickRandomWord();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guess the Word"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: "Enter your guess here",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _gameOver ? _replay : _checkGuess,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _gameOver ? Colors.green : Colors.blue,
                ),
                child: Text(_gameOver ? "Replay" : "Guess"),
              ),
              const SizedBox(height: 20),
              Text(
                _message,
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
