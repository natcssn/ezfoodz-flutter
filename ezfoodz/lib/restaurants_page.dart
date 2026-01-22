import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestaurantsPage extends StatefulWidget {
  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  List data = [];

  load() async {
    final r = await http.get(Uri.parse("http://127.0.0.1:8000/restaurants"));
    setState(() => data = jsonDecode(r.body)['restaurants']);
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("EZFOODZ"), backgroundColor: Colors.black),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: data.length,
        itemBuilder: (_, i) {
          return GestureDetector(
            onTap: () => Navigator.push(
              c,
              MaterialPageRoute(builder: (_) => MenuPage(data[i]['id'])),
            ),
            child: Card(
              color: Colors.grey[900],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.store, color: Colors.white, size: 40),
                  Text(data[i]['name'], style: TextStyle(color: Colors.white)),
                  Text(
                    "⭐ ${data[i]['rating']}",
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
