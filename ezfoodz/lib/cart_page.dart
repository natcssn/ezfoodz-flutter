import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List items;
  final Map<int, int> qty;
  CartPage(this.items, this.qty);

  @override
  Widget build(BuildContext c) {
    int total = 0;
    items.forEach((i) {
      total += (qty[i['id']] ?? 0) * i['price'] as int;
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("CART"), backgroundColor: Colors.black),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: items
                  .where((i) => (qty[i['id']] ?? 0) > 0)
                  .map(
                    (i) => ListTile(
                      title: Text(
                        i['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Text("₹${i['price']} x ${qty[i['id']]}"),
                    ),
                  )
                  .toList(),
            ),
          ),
          Text(
            "Total: ₹$total",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Proceed to Payment")),
        ],
      ),
    );
  }
}
