import 'package:flutter/material.dart';
import 'signup_mail.dart';
import 'menupage.dart';
import 'restaurants_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  final u = TextEditingController();
  final p = TextEditingController();

  login(BuildContext c) async {
    final r = await http.post(
      Uri.parse("http://127.0.0.1:8000/login"),
      body: {"username": u.text, "password": p.text},
    );
    if (r.statusCode == 200) {
      Navigator.push(c, MaterialPageRoute(builder: (_) => RestaurantsPage()));
    }
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ezfoodz",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            field("username/mail", u),
            field("password", p, true),
            ElevatedButton(onPressed: () => login(c), child: Text("Login")),
            TextButton(
              onPressed: () => Navigator.push(
                c,
                MaterialPageRoute(builder: (_) => SignupMail()),
              ),
              child: Text("Signup", style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }

  Widget field(String t, TextEditingController c, [bool p = false]) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: c,
        obscureText: p,
        decoration: InputDecoration(
          hintText: t,
          filled: true,
          fillColor: Colors.white12,
        ),
      ),
    );
  }
}
