import 'package:flutter/material.dart';

class Exersice6 extends StatefulWidget {
  const Exersice6({super.key});

  @override
  State<Exersice6> createState() => _Exersice6State();
}

class _Exersice6State extends State<Exersice6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 97, 154),
        title: const Text(
          'Tourist Place',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('asset/images/clock-tower.jpg'),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chiang Rai Clock Tower',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Chiang Rai, Thailand',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.red, size: 30),
                            SizedBox(width: 4),
                            Text('559', style: TextStyle(fontSize: 17)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.phone, color: Colors.blue),
                            Text('CALL', style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.directions, color: Colors.blue),
                            Text('ROUTE', style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.share, color: Colors.blue),
                            Text('SHARE', style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.'
                      'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,'
                      'ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel,'
                      'aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
