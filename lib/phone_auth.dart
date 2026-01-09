import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/otp_screen.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Phone Auth"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Enter phone number",
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: "+91${phoneController.text.trim()}",
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException ex) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(ex.message ?? "Verification failed")),
    );
  },
  codeSent: (String verificationId, int? resendToken) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            OtpScreen(verificationid: verificationId),
      ),
    );
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);

            },
            child: Text("Verify phone Number"),
          ),
        ],
      ),
    );
  }
}
