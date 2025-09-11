import 'package:flutter/material.dart';

class Design2Demo extends StatefulWidget {
  const Design2Demo({super.key});

  @override
  State<Design2Demo> createState() => _Design2DemoState();
}

class _Design2DemoState extends State<Design2Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.deepPurple,
            backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/en/thumb/9/96/Meme_Man_on_transparent_background.webp/316px-Meme_Man_on_transparent_background.png',
            ),
          ),
          Divider(color: Colors.grey, height: 60),
          Text('Name', style: TextStyle(color: Colors.grey[400])),
          Text(
            'Spider Man',
            style: TextStyle(color: Colors.yellow, fontSize: 20),
          ),
          Text('Age', style: TextStyle(color: Colors.grey[400])),
          Text('20', style: TextStyle(color: Colors.yellow, fontSize: 20)),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.email, color: Colors.grey[400]),
              SizedBox(width: 8),
              Text(
                'spider_man@gmail.com',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
