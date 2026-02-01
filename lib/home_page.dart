import 'package:flutter/material.dart';
import 'package:restaurant/show_item_page.dart';
import 'package:restaurant/Cart/CartPage.dart';
import 'package:restaurant/Order/order_history.dart';
import 'package:restaurant/Payment/PaymentPage.dart';
import 'package:restaurant/Restaurant Page/RestaurantPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        elevation: 0,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
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
            SizedBox(height: 15),
            // Buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryButton(context, "Show Item", ShowItemPage()),
                  _buildCategoryButton(context, "Restaurant Info", RestaurantInfoImagePage() ), // Replace with respective pages
                  _buildCategoryButton(context, "Cart", CartPage()), // Replace with respective pages
                  _buildCategoryButton(context, "Order", Order_historyPage()), // Replace with respective pages
                  _buildCategoryButton(context, "Payment", PaymentPage(totalAmount: 0.0, phoneNumber: '',)), // Replace with respective pages
                ],
              ),
            ),
            SizedBox(height: 20),
            // Best Deals
            Text(
              "Best Deals",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildItemList(context, "Bake Offer's you super discount", "assets/image/img1.jpg"),
            _buildItemList(context, "Get your meal up to 30%", "assets/image/img1.jpg"),
            SizedBox(height: 20),
            // Recent View
            Text(
              "Recent View",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildItemList(context, "Pizza,Spicy and crispy chicken wings served with a tangy sauce.", "assets/image/vegatable_pizza.jpg"),
            _buildItemList(context, "Burger", "assets/image/burger.jpg"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Add to Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String text, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Text(text), // Dynamically display the text
      ),
    );
  }

  Widget _buildItemList(BuildContext context, String title, String imagePath) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text("More"),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Add item details or navigation
        },
      ),
    );
  }
}


//updated
// import 'package:flutter/material.dart';
// import 'show_item_page.dart'; // Import the Show Item page
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//
//   // Pages for navigation
//   final List<Widget> _pages = [
//     const Center(child: Text("Home page")),
//     const Center(child: Text("Search Page")),
//     ShowItemPage(), // Show Item Page
//     const Center(child: Text("Add to Cart Page")),
//     const Center(child: Text("Restaurant List Page")),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: _pages[_currentIndex], // Switch between pages
//
//       // Bottom Navigation Bar
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         selectedItemColor: Colors.deepPurple,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: "Search",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list_alt),
//             label: "Show Items",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: "Add to Cart",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.restaurant_menu),
//             label: "Restaurants",
//           ),
//         ],
//       ),
//     );
//   }
// }







