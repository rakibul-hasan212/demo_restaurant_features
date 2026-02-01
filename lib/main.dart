// import 'package:flutter/material.dart';
// import 'package:restaurant/welcome_page.dart';
// // import 'welcome_page.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Restaurant App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: WelcomePage(),
//     );
//   }
// }

//updated
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'welcome_page.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'package:restaurant/Cart/CartPage.dart';
import 'package:restaurant/Payment/PaymentPage.dart';
import 'package:restaurant/Order/order_history.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/welcome', // Start with Welcome Page
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/cart': (context) => CartPage(),
        '/payment': (context) => PaymentPage(totalAmount: 0.0, phoneNumber: '',),
        '/orderHistory': (context) => Order_historyPage(),
      },
    );
  }
}
