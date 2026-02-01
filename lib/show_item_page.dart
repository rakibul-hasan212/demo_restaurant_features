import 'package:flutter/material.dart';
import 'package:restaurant/item_details_page.dart';


class ShowItemPage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      "name": "Burger",
      "price": 5,
      "rating": 4.9,
      "image": "assets/image/burger.jpg",
      "description": "A delicious burger with fresh ingredients and a juicy patty."
    },
    {
      "name": "Kacci",
      "price": 3,
      "rating": 4.8,
      "image": "assets/image/kacci.png",
      "description": "Crispy golden fries with a sprinkle of salt."
    },
    {
      "name": "Chicken Wings",
      "price": 7,
      "rating": 4.7,
      "image": "assets/image/chiken_wings.jpg",
      "description": "Spicy and crispy chicken wings served with a tangy sauce."
    },
    {
      "name": "Morog Pulao",
      "price": 7,
      "rating": 4.7,
      "image": "assets/image/morog_pulao.jpg",
      "description": "Spicy and crispy chicken wings served with a tangy sauce."
    },
    {
      "name": "Teheri",
      "price": 7,
      "rating": 4.7,
      "image": "assets/image/teheri.jpg",
      "description": "Spicy and crispy chicken wings served with a tangy sauce."
    },
    {
      "name": "Pizza",
      "price": 7,
      "rating": 4.7,
      "image": "assets/image/vegatable_pizza.jpg",
      "description": "Spicy and crispy chicken wings served with a tangy sauce."
    },
    // Add more items here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        elevation: 0,
        title: Text("Show Item List"),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Grid of items
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to Item Details Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailsPage(item: item),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item["image"], height: 80, fit: BoxFit.cover),
                        SizedBox(height: 10),
                        Text(
                          item["name"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Price: \$${item["price"]}"),
                        Text("⭐ ${item["rating"]}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // BottomNavigationBar(          // Bottom navigation bar it's changeable
          //   backgroundColor: Colors.grey.shade800,
          //   unselectedItemColor: Colors.white,
          //   selectedItemColor: Colors.green,
          //   items: [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          //     BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          //   ],
          // ),
        ],
      ),
    );
  }
}
// 2nd updated
// import 'package:flutter/material.dart';
// import 'package:restaurant/item_details_page.dart';
// class ShowItemPage extends StatelessWidget {
//   final List<Map<String, dynamic>> items = [
//     {'name': 'Pizza', 'price': 8.99, 'rating': 4.5},
//     {'name': 'Burger', 'price': 5.49, 'rating': 4.3},
//     {'name': 'Pasta', 'price': 6.99, 'rating': 4.7},
//     {'name': 'Fried Chicken', 'price': 7.99, 'rating': 4.6},
//     {'name': 'Salad', 'price': 4.49, 'rating': 4.1},
//     {'name': 'Sandwich', 'price': 3.99, 'rating': 4.0},
//     {'name': 'Sushi', 'price': 10.99, 'rating': 4.8},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Item List"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final item = items[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//             elevation: 2,
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: Colors.deepPurpleAccent,
//                 child: Text(
//                   item['name'][0], // First letter of the item name
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//               title: Text(
//                 item['name'],
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               subtitle: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Price: \$${item['price'].toStringAsFixed(2)}",
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.star, color: Colors.amber, size: 16),
//                       Text(
//                         " ${item['rating']}",
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// Nevigate from the database
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// //import 'product_info_page.dart';
//
// class ShowItemPage extends StatelessWidget {
//   const ShowItemPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Item List"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('products').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text("No items found"));
//           }
//
//           final products = snapshot.data!.docs;
//
//           return ListView.builder(
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ItemDetailsPage(
//                         name: product['name'],
//                         price: product['price'],
//                         rating: product['rating'],
//                         image: product['image'],
//                         description: product['description'],
//                         restaurant: product['restaurant'],
//                       ),
//                     ),
//                   );
//                 },
//                 child: Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   elevation: 2,
//                   child: ListTile(
//                     leading: Image.network(
//                       product['image'],
//                       width: 60,
//                       height: 60,
//                       fit: BoxFit.cover,
//                     ),
//                     title: Text(
//                       product['name'],
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     subtitle: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Price: \$${product['price']}"),
//                         Row(
//                           children: [
//                             const Icon(Icons.star, color: Colors.amber, size: 16),
//                             Text(" ${product['rating']}"),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
