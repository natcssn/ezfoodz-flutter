import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu")),
      body: const Center(
        child: Text("Welcome to EZFOODZ 🍔", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
