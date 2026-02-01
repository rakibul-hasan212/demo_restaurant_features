import 'package:flutter/material.dart';
import 'cart_manager.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.blue.shade500,
      ),
      body: cartItems.isEmpty
          ? Center(child: Text("Your cart is empty!"))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.asset(item["image"], width: 50, height: 50, fit: BoxFit.cover),
              title: Text(item["name"]),
              subtitle: Text("Price: \$${item["price"]}\nQuantity: ${item["quantity"]}"),
              trailing: Text("\$${item["price"] * item["quantity"]}"),
            ),
          );
        },
      ),
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            CartManager.clearCart();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Order placed successfully!")),
            );
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          child: Text("Place Order", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
