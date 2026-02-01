// import 'package:flutter/material.dart';
// import 'package:restaurant/login_page.dart';
// // import 'login_page.dart';
//
// class WelcomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade900,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Restaurant Discovery\nAnd Experience",
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.white, fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/img1.jpg'), // Replace with your image asset
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Hey\nWelcome",
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
//               child: Text("Let's Started"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//updated
import 'package:flutter/material.dart';
import 'package:restaurant/login_page.dart';
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Restaurant Discovery\nAnd Experience",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24),
             ),
            SizedBox(height: 20),
            CircleAvatar(
                radius: 50,
              backgroundImage: AssetImage('assets/image/img1.jpg'), // Replace with your image asset
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text("Let's Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
