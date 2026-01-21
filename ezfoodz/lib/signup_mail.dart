import 'package:flutter/material.dart';
import 'signup_otp.dart';
import 'package:http/http.dart' as http;

class SignupMail extends StatelessWidget {
  final mail = TextEditingController();

  sendOtp(BuildContext c) async {
    await http.post(
      Uri.parse("http://127.0.0.1:8000/start-signup"),
      body: {"email": mail.text},
    );
    Navigator.push(c, MaterialPageRoute(builder: (_) => SignupOTP(mail.text)));
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: Column(
        children: [
          field("college mail", mail),
          Expanded(
            child: Center(
              child: Text(
                "Proof of identity / document",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ElevatedButton(onPressed: () => sendOtp(c), child: Text("Signup")),
        ],
      ),
    );
  }

  Widget field(String t, TextEditingController c) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: c,
        decoration: InputDecoration(hintText: t, filled: true),
      ),
    );
  }
}
