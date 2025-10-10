import 'dart:math';
import 'package:flutter/material.dart';

class Fishing extends StatefulWidget {
  const Fishing({super.key});

  @override
  State<Fishing> createState() => _FishingState();
}

class _FishingState extends State<Fishing> {
  // Fish data
  List fish = [
    {
      'name': 'AnglerFish',
      'price': 20,
      'image': 'assets/images/anglerfish.png',
    },
    {
      'name': 'NeonTerTra',
      'price': 10,
      'image': 'assets/images/neon-tetra.png',
    },
    {'name': 'Puffer', 'price': 5, 'image': 'assets/images/puffer-fish.png'},
    {'name': 'Shark', 'price': 10, 'image': 'assets/images/shark.png'},
  ];

  int totalWorms = 5;
  int coins = 0;
  String _message = '';
  bool isGameOver = false;
  String fishImage = 'assets/images/fisherman.png';

  void fishingStart() {
    final random = Random();
    setState(() {
      if (totalWorms > 0) {
        totalWorms--;

        final fishRandom = fish[random.nextInt(fish.length)];
        final int quantity = 1 + random.nextInt(5);

        final name = fishRandom['name'];
        final price = fishRandom['price'] as int;
        final image = fishRandom['image'];

        final int earnedCoins = price * quantity;
        coins += earnedCoins;

        _message = '$name x $quantity = $earnedCoins coins';
        fishImage = image;

        if (totalWorms == 0) {
          isGameOver = true;
          _message = '';
        }
      }
    });
  }

  void resetGame() {
    setState(() {
      coins = 0;
      totalWorms = 5;
      isGameOver = false;
      _message = '';
      fishImage = 'assets/images/fisherman.png';
    });
  }

  List<Widget> buildWormIcons() {
    List<Widget> icons = [];
    for (int i = 0; i < totalWorms; i++) {
      icons.add(Icon(Icons.waves_rounded, color: Colors.red));
    }
    return icons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fishing Game', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Worms: ', style: TextStyle(fontSize: 18)),
                  ...buildWormIcons(),
                  // ...List.generate(
                    // totalWorms,
                    // (index) => Icon(Icons.waves_rounded, color: Colors.red),
                  // ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.currency_exchange, color: Colors.amber),
                  SizedBox(width: 8),
                  Text('$coins', style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(height: 20),
              Image.asset(fishImage, height: 200),
              SizedBox(height: 20),
              Text(
                _message,
                style: TextStyle(
                  fontSize: 18,
                  color: !isGameOver ? Colors.black : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: !isGameOver ? fishingStart : null,
                style: FilledButton.styleFrom(backgroundColor: Colors.green),
                child: Text('Fishing'),
              ),
              SizedBox(height: 10),
              FilledButton(
                onPressed: resetGame,
                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
