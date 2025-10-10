import 'package:flutter/material.dart';

class CoffeeOrderApp extends StatefulWidget {
  const CoffeeOrderApp({super.key});

  @override
  State<CoffeeOrderApp> createState() => _CoffeeOrderAppState();
}

class _CoffeeOrderAppState extends State<CoffeeOrderApp> {
  bool isCold = false;
  double sugarValue = 2;

  void toggleSwitch(bool value) {
    setState(() {
      isCold = value;
    });
  }

  final Map<double, String> sugarLebels = {
    0: 'No Sugar',
    1: 'Less Sugar',
    2: 'Normal',
  };

  void showAlert(BuildContext context) async {
    String coffeeType = isCold ? 'Cold' : 'Hot';
    String sugarLevel = sugarLebels[sugarValue] ?? 'Normal';

    String contentOrderSum = '$coffeeType coffee with $sugarLevel';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your Order'),
          content: Text(contentOrderSum),
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
            const SizedBox(height: 10),
            Row(
              children: [
                Text('Type'),
                Spacer(),
                Row(
                  children: [
                    Text('hot'),
                    Switch(value: isCold, onChanged: toggleSwitch),
                    Text('Cold'),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Sugar level'),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
