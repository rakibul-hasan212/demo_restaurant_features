import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

class OtpService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Generate a random 4-digit OTP
  String generateOtp() {
    final random = Random();
    return (random.nextInt(9000) + 1000).toString(); // Ensures a 4-digit number
  }

  // Send OTP to the provided phone number
  Future<void> sendOtp(String phoneNumber, Function(String) codeSentCallback) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Handle auto-retrieval or instant verification (if applicable)
      },
      verificationFailed: (FirebaseAuthException e) {
        throw e; // Handle errors (e.g., invalid phone number)
      },
      codeSent: (String verificationId, int? resendToken) {
        // Send the verificationId back via the callback
        codeSentCallback(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Called after the timeout duration
      },
    );
  }

  // Verify the OTP entered by the user
  Future<void> verifyOtp(String verificationId, String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    // Sign in with the credential to verify the OTP
    await _auth.signInWithCredential(credential);
  }
}
