import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuPage extends StatefulWidget {
  final int rid;
  MenuPage(this.rid);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List items = [];
  Map<int, int> qty = {};

  load() async {
    final r = await http.get(
      Uri.parse("http://127.0.0.1:8000/menu/${widget.rid}"),
    );
    setState(() => items = jsonDecode(r.body)['items']);
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
      appBar: AppBar(title: Text("Menu"), backgroundColor: Colors.black),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, i) {
                final id = items[i]['id'];
                qty[id] = qty[id] ?? 0;
                return ListTile(
                  title: Text(
                    items[i]['name'],
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove, color: Colors.red),
                        onPressed: () {
                          setState(
                            () => qty[id] = qty[id]! - 1 < 0 ? 0 : qty[id]! - 1,
                          );
                        },
                      ),
                      Text(
                        qty[id].toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.green),
                        onPressed: () {
                          setState(() => qty[id] = qty[id]! + 1);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              c,
              MaterialPageRoute(builder: (_) => CartPage(items, qty)),
            ),
            child: Text("View Cart"),
          ),
        ],
      ),
    );
  }
}
