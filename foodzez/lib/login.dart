import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String backendIp = 'localhost:6969';
  String message = "";

  Future<void> login() async {
    final response = await http.post(
      Uri.parse('http://$backendIp/loginbackend'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': usernameController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200 &&
        response.body.toLowerCase().contains("success")) {
      // 🔁 Redirect to menu page
      Navigator.pushReplacementNamed(context, '/menu');
    } else {
      // ❌ Show error message
      setState(() {
        message = response.body;
      });
    }
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
              _inputBox(
                "password",
                controller: passwordController,
                obscure: true,
              ),

              const SizedBox(height: 25),

              ElevatedButton(onPressed: login, child: const Text("login")),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text("Create account"),
              ),

              const SizedBox(height: 20),

              Text(message, style: const TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputBox(
    String hint, {
    bool obscure = false,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
