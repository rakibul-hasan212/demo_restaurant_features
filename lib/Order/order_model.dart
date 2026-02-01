import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String name; // User's name
  final String phone; // User's phone number
  final String items; // Ordered items (e.g., "Pizza, Burger")
  final double totalPrice; // Total price of the order
  final DateTime date; // Order date

  // Constructor
  Order({
    required this.name,
    required this.phone,
    required this.items,
    required this.totalPrice,
    required this.date,
  });

  // Convert Order object to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'items': items,
      'totalPrice': totalPrice,
      'date': date.toIso8601String(), // Store date as an ISO string
    };
  }

  // Create an Order object from Firestore map
  factory Order.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Order(
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      items: data['items'] ?? '',
      totalPrice: data['totalPrice']?.toDouble() ?? 0.0,
      date: DateTime.parse(data['date'] ?? DateTime.now().toIso8601String()),
    );
  }
}
