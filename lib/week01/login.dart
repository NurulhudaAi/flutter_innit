import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _loginMessage = '';
  Color _messageColor = Colors.black;

  void _buttonLogin() {
    setState(() {
      String username = _usernameController.text;
      String password = _passwordController.text;

      //check if username & password macthing
      if (username == 'admin' && password == '1234') {
        _loginMessage = 'Welcome Admin';
        _messageColor = Colors.red;
      } else {
        _loginMessage = 'Wrong username and password';
        _messageColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'password'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _buttonLogin,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                backgroundColor: Colors.blue[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18), // Rounded corners
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Text(
                _loginMessage,
                style: TextStyle(color: _messageColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
