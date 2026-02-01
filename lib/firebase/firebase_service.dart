// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:restaurant/Order/order_model.dart'
//
// Future<void> saveOrderToFirebase(Order order) async {
//   final ordersCollection = FirebaseFirestore.instance.collection('orders');
//   try {
//     await ordersCollection.add({
//       'name': order.name,
//       'phone': order.phone,
//       'items': order.items,
//       'totalPrice': order.totalPrice,
//       'date': order.date.toIso8601String(),
//     });
//   } catch (error) {
//     print("Error saving order: $error");
//     throw error;
//   }
// }
