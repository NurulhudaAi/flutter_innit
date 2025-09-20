import 'package:flutter/material.dart';

class Exersice5 extends StatefulWidget {
  const Exersice5({super.key});

  @override
  State<Exersice5> createState() => _Exersice5State();
}

class _Exersice5State extends State<Exersice5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 127, 81, 157),
        title: const Text(
          'Cooking Recipes',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Papaya Salad',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 127, 81, 157),
                        ),
                      ),
                      child: const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Donec convallis rhoncus nunc, ut iaculis nulla commodo id. '
                        'In tempus lacinia eros, at interdum tellus ornare ne',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/images/salad.jpg',
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.black),
                          ],
                        ),
                        const Text('3128 reviews'),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: const [
                                Icon(Icons.timelapse),
                                Text('PREP:'),
                                Text('5 mins'),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Column(
                              children: const [
                                Icon(Icons.timer_outlined, color: Colors.red),
                                Text(
                                  'COOK:',
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text(
                                  '10 mins',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Column(
                              children: const [
                                Icon(Icons.food_bank_outlined),
                                Text('FEEDS:'),
                                Text('1-3'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
