import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatelessWidget {
  final user = TextEditingController();
  final pass = TextEditingController();

  Future<void> signup(BuildContext ctx) async {
    await http.post(
      Uri.parse("http://127.0.0.1:8000/register"),
      body: {"username": user.text, "password": pass.text},
    );
    Navigator.pop(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: user,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: pass,
              decoration: InputDecoration(labelText: "Password"),
            ),
            ElevatedButton(
              onPressed: () => signup(context),
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
