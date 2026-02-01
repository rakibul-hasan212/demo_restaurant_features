import 'package:flutter/material.dart';
import 'package:restaurant/Cart/cart_manager.dart';

class Order_historyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pastOrders = CartManager.order_history;

    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
        backgroundColor: Colors.blue.shade500,
      ),
      backgroundColor: Colors.blue.shade100,
      body: pastOrders.isEmpty
          ? Center(
        child: Text(
          "No orders yet.",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: pastOrders.length,
        itemBuilder: (context, index) {
          final order = pastOrders[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(order["name"]),
              subtitle: Text("Price: \$${order["price"]}"),
            ),
          );
        },
      ),
    );
  }
}
