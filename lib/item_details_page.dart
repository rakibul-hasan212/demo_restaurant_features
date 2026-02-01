import 'package:flutter/material.dart';
import 'package:restaurant/Cart/cart_manager.dart';

class ItemDetailsPage extends StatefulWidget {
  final Map<String, dynamic> item;

  const ItemDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        elevation: 0,
        title: Text(item["name"]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(item["image"], height: 150, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(
              item["name"],
              style: TextStyle(color: Colors.black87, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "\$${item["price"]}",
              style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              item["description"],
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            SizedBox(height: 20),
            // Quantity Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quantity:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                      icon: Icon(Icons.remove, color: Colors.red),
                    ),
                    Text(quantity.toString(), style: TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: Icon(Icons.add, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            // Add to Cart Button
            ElevatedButton(
              onPressed: () {
                CartManager.addToCart(item, quantity);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${item["name"]} added to cart!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Center(
                child: Text("Add to Cart", style: TextStyle(fontSize: 18)),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade100,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/payment', arguments: {
                  'productName': item["name"],
                  'productPrice': "\$${item["price"]}",
                });
              },
              child: const Text("Buy Now"),
            ),
          ],
        ),
      ),
    );
  }
}


// nevigate database
// import 'package:flutter/material.dart';
//
// class ItemDetailsPage extends StatelessWidget {
//   final String name;
//   final double price;
//   final double rating;
//   final String image;
//   final String description;
//   final String restaurant;
//
//   const ItemDetailsPage({
//     Key? key,
//     required this.name,
//     required this.price,
//     required this.rating,
//     required this.image,
//     required this.description,
//     required this.restaurant,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(
//               image,
//               width: double.infinity,
//               height: 250,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     "Price: \$${price.toString()}",
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.star, color: Colors.amber),
//                       Text(" $rating"),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     "Description: $description",
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     "Restaurant: $restaurant",
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

