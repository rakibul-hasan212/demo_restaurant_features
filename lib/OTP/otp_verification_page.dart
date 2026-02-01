import 'package:flutter/material.dart';

class OtpVerificationPage extends StatefulWidget {
  final String phoneNumber; // Accept the dynamic phone number

  const OtpVerificationPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify OTP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Enter the OTP sent to ${widget.phoneNumber}"),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 4,
              onChanged: (value) {
                otp = value;
              },
              decoration: InputDecoration(
                hintText: "Enter OTP",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Verify the OTP and proceed
                if (otp.length == 4) {
                  // Handle successful OTP verification
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("OTP Verified!")),
                  );
                } else {
                  // Handle OTP error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Invalid OTP!")),
                  );
                }
              },
              child: Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
