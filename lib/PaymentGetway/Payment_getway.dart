import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/OTP/otp_verification_page.dart';
import 'package:restaurant/Payment/PaymentPage.dart';

class PaymentGatewayPage extends StatelessWidget {
  final double totalAmount;

  const PaymentGatewayPage({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Payment Method"),
        backgroundColor: Colors.blue.shade500,
      ),
      backgroundColor: Colors.blue.shade100,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            "Choose your payment method:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          _buildPaymentOption(context, "Bkash", Icons.mobile_friendly, totalAmount),
          _buildPaymentOption(context, "Nagad", Icons.account_balance_wallet, totalAmount),
          _buildPaymentOption(context, "SSL", Icons.payment, totalAmount),
          _buildPaymentOption(context, "Dutch Bangla", Icons.credit_card, totalAmount),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
      BuildContext context, String method, IconData icon, double amount) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue.shade500, size: 40),
        title: Text(method, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                final user = FirebaseAuth.instance.currentUser; // Get the current user
                final phoneNumber = user?.phoneNumber ?? "Unknown";

                return PaymentPage(
                  totalAmount: totalAmount,
                  phoneNumber: phoneNumber,
                );
              },
            ),
          );

        },
      ),
    );
  }
}
