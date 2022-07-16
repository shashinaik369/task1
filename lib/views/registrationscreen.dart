import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/services.dart/authservice.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'password',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await authService.createUserWithEmailAndPassword(
                  emailController.text, passwordController.text);
              Navigator.pop(context);
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
