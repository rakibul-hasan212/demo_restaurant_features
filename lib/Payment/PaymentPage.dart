import 'package:flutter/material.dart';
import 'package:restaurant/OTP/otp_verification_page.dart';

class PaymentPage extends StatefulWidget {
  final double totalAmount;
  final String phoneNumber; // Accept dynamic phone number

  const PaymentPage({Key? key, required this.totalAmount, required this.phoneNumber}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Column(
        children: [
          // Payment Options
          ListTile(
            title: Text("Bkash"),
            leading: Radio<String>(
              value: "Bkash",
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Nagad"),
            leading: Radio<String>(
              value: "Nagad",
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Ensure a payment method is selected
              if (selectedPaymentMethod == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please select a payment method!")),
                );
                return;
              }

              // Navigate to OTP Verification Page with dynamic phone number
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpVerificationPage(
                    phoneNumber: widget.phoneNumber, // Pass the dynamic phone number
                  ),
                ),
              );
            },
            child: Text("Confirm and Pay"),
          ),
        ],
      ),
    );
  }
}
