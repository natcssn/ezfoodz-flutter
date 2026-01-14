import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String backendIp = 'localhost:6969';

  String message = "";

  Future<void> signup() async {
    final response = await http.post(
      Uri.parse('http://$backendIp/registerbackend'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': usernameController.text,
        'password': passwordController.text,
      }),
    );

    setState(() {
      message = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "EZFOODZ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              _inputBox("username", controller: usernameController),
              const SizedBox(height: 15),
              _inputBox("password", controller: passwordController),

              const SizedBox(height: 20),

              ElevatedButton(onPressed: signup, child: const Text("sign up")),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back to login"),
              ),

              const SizedBox(height: 20),

              Text(message, style: const TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputBox(String hint, {required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
