import 'package:flutter/material.dart';
import 'dart:math';

class GuessGame extends StatefulWidget {
  const GuessGame({super.key});

  @override
  State<GuessGame> createState() => _GuessGameState();
}

class _GuessGameState extends State<GuessGame> {
  TextEditingController userNum = TextEditingController();
  String _result = '';
  int chancePlay = 3;
  late int programNum;
  bool isgameOver = false;

  @override
  void initState() {
    super.initState();
    _generateRandomNum();
  }

  // random number
  void _generateRandomNum() {
    programNum = Random().nextInt(10);
    chancePlay = 3;
    isgameOver = false;
  }

  void _checkGuess() {
    int? guess = int.tryParse(userNum.text);
    if (guess == null) {
      setState(() {
        _result = 'please enter a number';
      });
      return;
    }
    setState(() {
      if (guess == programNum) {
        _result = 'Correct, you win!';
        isgameOver = true;
      } else {
        chancePlay--;
        if (chancePlay > 0) {
          if (guess > programNum) {
            _result = '$guess is to large, $chancePlay chance(s) left!';
          } else {
            _result = '$guess is to low, $chancePlay chance(s) left!';
          }
        } else {
          _result = 'Sorry, you lose. The answer is $programNum';
          isgameOver = true;
        }
      }
      userNum.clear();
    });
  }

  void _replay() {
    setState(() {
      _generateRandomNum();
      userNum.clear();
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guess a number game')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: userNum,
                decoration: InputDecoration(hintText: 'Guess a number 0-9'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Text(
                _result,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isgameOver ? _replay : _checkGuess,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.black, width: 1),
                  ),
                ),

                child: Text(isgameOver ? 'Replay' : 'Guess'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
