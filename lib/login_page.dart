// import 'package:flutter/material.dart';
// // import 'signup_page.dart';
// import 'package:restaurant/signup_page.dart';
// import 'package:restaurant/home_page.dart';
// // import 'home_page.dart';
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade900,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Log In",
//                 style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: 'Enter your email',
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: 'Password',
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextButton(
//                 onPressed: () {},
//                 child: Text("Forgot password", style: TextStyle(color: Colors.green)),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Perform login operation
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomePage()),
//                   );
//
//                 },
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 child: Text("Log In"),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 "or",
//                 style: TextStyle(color: Colors.white),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
//                 },
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 child: Text("Sign Up"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//updated
// import 'package:flutter/material.dart';
// import 'package:restaurant/home_page.dart';
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   void _login() {
//     // Simulate login logic
//     if (_emailController.text == 'user@example.com' &&
//         _passwordController.text == 'password123') {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Login Successful!')),
//       );
//       // Navigate to Home Page
//
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invalid credentials!')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade100,
//       appBar: AppBar(title: const Text('Log In')),
//       body: Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//         ElevatedButton(
//                 onPressed: () {
//                   // Perform login operation
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomePage()),
//                   );
//
//                 },
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 child: Text("Log In"),
//               ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/signup');
//               },
//               child: const Text('Don’t have an account? Sign Up'),
//             ),
//           ],
//         ),
//       ),
//       ),
//     );
//   }
// }
// with database part
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurant/home_page.dart';
import 'signup_page.dart'; // Import the SignUp Page for navigation.

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance.

  // Method to login the user
  Future<void> _login() async {
    try {
      // Sign in with email and password using Firebase Auth.
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Navigate to the Home Page if login is successful.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      // Handle login failure
      if (e.toString().contains('user-not-found')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not found. Please register first!')),
        );
      } else if (e.toString().contains('wrong-password')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect password!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(title: const Text('Log In')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login, // Call the login method here
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Log In"),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to the SignUp Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: const Text('Don’t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
