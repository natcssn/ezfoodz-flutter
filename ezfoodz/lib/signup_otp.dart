import 'package:flutter/material.dart';
import 'signup_details.dart';
import 'package:http/http.dart' as http;

class SignupOTP extends StatelessWidget {
  final String email;
  SignupOTP(this.email);

  final otp = TextEditingController();

  verify(BuildContext c) async {
    final r = await http.post(
      Uri.parse("http://127.0.0.1:8000/verify-otp"),
      body: {"email": email, "otp": otp.text},
    );
    if (r.statusCode == 200) {
      Navigator.push(
        c,
        MaterialPageRoute(builder: (_) => SignupDetails(email)),
      );
    }
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 80),
          Text("OTP sent to mail", style: TextStyle(color: Colors.white)),
          TextField(controller: otp),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => verify(c),
            child: Text("Proceed to details"),
          ),
        ],
      ),
    );
  }
}
