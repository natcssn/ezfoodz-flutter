import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List items = [];

  @override
  void initState() {
    super.initState();
    loadMenu();
  }

  Future<void> loadMenu() async {
    final res = await http.get(Uri.parse("http://127.0.0.1:8000/menu"));
    setState(() {
      items = jsonDecode(res.body)["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Canteen Menu")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (c, i) {
          return ListTile(
            title: Text(items[i]["name"]),
            trailing: Text("₹${items[i]["price"]}"),
          );
        },
      ),
    );
  }
}
