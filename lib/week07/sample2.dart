import 'package:flutter/material.dart';

class FruitMemoryGame extends StatefulWidget {
  const FruitMemoryGame({super.key});

  @override
  _FruitMemoryGameState createState() => _FruitMemoryGameState();
}

class _FruitMemoryGameState extends State<FruitMemoryGame> {
  // Sample fruit data (name and image URL)
  final List<Map<String, String>> fruits = [
    {
      'name': 'Apple',
      'url':
          'https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg',
    },
    {
      'name': 'Banana',
      'url':
          'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg',
    },
    {
      'name': 'Orange',
      'url':
          'https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg',
    },
    {
      'name': 'Grape',
      'url':
          'https://upload.wikimedia.org/wikipedia/commons/3/36/Kyoho-grape.jpg',
    }, // <-- FIXED
    {
      'name': 'Pineapple',
      'url':
          'https://upload.wikimedia.org/wikipedia/commons/c/cb/Pineapple_and_cross_section.jpg',
    },
  ];

  // Placeholder for the "shown" fruit
  String? currentFruitUrl;
  bool showButtons = false; // Show answer buttons after sequence

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fruit Memory Game')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display the fruit being shown, or a placeholder
            SizedBox(
              height: 140,
              child: currentFruitUrl != null
                  ? Image.network(currentFruitUrl!)
                  : Center(
                      child: Text(
                        'Press Start to begin!',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
            ),
            SizedBox(height: 24),

            // "Start Game" button
            ElevatedButton(
              onPressed: () {
                // Here you would implement the logic to show fruits in sequence
                // For now, just pick one fruit to show as placeholder
                setState(() {
                  currentFruitUrl = fruits[0]['url'];
                  showButtons = true;
                });
              },
              child: Text('Start Game'),
            ),
            SizedBox(height: 32),

            // Show fruit choice buttons if needed
            if (showButtons)
              Wrap(
                spacing: 16,
                children: fruits.map((fruit) {
                  return Column(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.network(fruit['url']!),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle user's answer selection
                        },
                        child: Text(fruit['name']!),
                      ),
                    ],
                  );
                }).toList(),
              ),

            // You can add a Text for instructions or result message here
            SizedBox(height: 24),
            Text(
              'Select the fruits in the order they appeared!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
