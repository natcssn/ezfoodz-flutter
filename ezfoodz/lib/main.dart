import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const EZFoodzApp());
}

class EZFoodzApp extends StatelessWidget {
  const EZFoodzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EZFOODZ',
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}
