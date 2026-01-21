import 'package:flutter/material.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

class SignupDetails extends StatelessWidget {
  final String email;
  SignupDetails(this.email);

  final u = TextEditingController();
  final p = TextEditingController();
  final a = TextEditingController();

  create(BuildContext c) async {
    await http.post(
      Uri.parse("http://127.0.0.1:8000/create-account"),
      body: {
        "email": email,
        "username": u.text,
        "password": p.text,
        "address": a.text,
      },
    );
    Navigator.pushAndRemoveUntil(
      c,
      MaterialPageRoute(builder: (_) => LoginPage()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          field("Username / nickname", u),
          field("Password", p),
          field("Hostel room / address", a),
          ElevatedButton(
            onPressed: () => create(c),
            child: Text("Proceed to login"),
          ),
        ],
      ),
    );
  }

  Widget field(String t, TextEditingController c) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: TextField(
        controller: c,
        decoration: InputDecoration(hintText: t),
      ),
    );
  }
}
