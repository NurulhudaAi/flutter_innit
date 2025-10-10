import 'package:flutter/material.dart';

class CoffeeOrderApp2 extends StatefulWidget {
  const CoffeeOrderApp2({super.key});

  @override
  State<CoffeeOrderApp2> createState() => _CoffeeOrderAppState();
}

class _CoffeeOrderAppState extends State<CoffeeOrderApp2> {
  bool isCold = false;
  double sugarValue = 2;
  String selectedCoffee = 'Latte';
  bool showThankU = false;

  void toggleSwitch(bool value) {
    setState(() {
      isCold = value;
    });
  }

  List coffee = [
    {
      'name': 'Latte',
      'image':
          'https://abeautifulmess.com/wp-content/uploads/2023/05/latte.jpg',
      'price': 35,
    },
    {
      'name': 'Americano',
      'image':
          'https://images.ctfassets.net/v601h1fyjgba/1vlXSpBbgUo9yLzh71tnOT/a1afdbe54a383d064576b5e628035f04/Iced_Americano.jpg',
      'price': 30,
    },
    {
      'name': 'Capuccino',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/c/c8/Cappuccino_at_Sightglass_Coffee.jpg',
      'price': 40,
    },
  ];

  final Map<double, String> sugarLebels = {0: 'No', 1: 'Less', 2: 'Normal'};

  void showAlert(BuildContext context) async {
    String coffeeType = isCold ? 'Cold' : 'Hot';
    String sugarLevel = sugarLebels[sugarValue] ?? 'Normal';

    var selected = coffee.firstWhere((cf) => cf['name'] == selectedCoffee);
    int price = selected['price'];
    String image = selected['image'];

    if (isCold) price += 5;

    String contentOrderSum =
        '$coffeeType $selectedCoffee  with $sugarLevel sugar. Price = $price baht';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(image, height: 150, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Text(contentOrderSum),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  showThankU = false;
                });
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  showThankU = true;
                });
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MFU Coffee Shop', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple[400],
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Order',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Coffee', style: TextStyle(fontWeight: FontWeight.bold)),
                for (var item in coffee)
                  RadioListTile(
                    title: Text('${item['name']} ${item['price']}'),
                    value: item['name'],
                    groupValue: selectedCoffee,
                    onChanged: (value) {
                      setState(() {
                        selectedCoffee = value.toString();
                      });
                    },
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Row(
                  children: [
                    Text('hot'),
                    Switch(value: isCold, onChanged: toggleSwitch),
                    Text('Cold (+5)'),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sugar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    Text('None'),
                    Spacer(),
                    Slider(
                      value: sugarValue,
                      max: 2,
                      min: 0,
                      divisions: 2,
                      label: sugarLebels[sugarValue],
                      onChanged: (value) {
                        setState(() {
                          sugarValue = value;
                        });
                      },
                    ),
                    Text('Normal'),
                  ],
                ),
                FilledButton(
                  onPressed: () => showAlert(context),
                  child: Text('ORDER'),
                ),
                const SizedBox(height: 8),
                if (showThankU)
                  const Center(
                    child: Text(
                      'Thank you for your order!',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
