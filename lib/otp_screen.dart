import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/dashboard/view/dashboard_screen.dart';

class OtpScreen extends StatefulWidget {
 final String verificationid;
 const OtpScreen({super.key, required this.verificationid});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("OTP Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              decoration: InputDecoration(
                hintText: "Enter the Otp",
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
              try {
                PhoneAuthCredential credential =
                     PhoneAuthProvider.credential(
                      verificationId: widget.verificationid,
                      smsCode: otpController.text.toString(),
                    );
                FirebaseAuth.instance.signInWithCredential(credential).then((
                  value,
                ) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                });
              } catch (ex) {
                log(ex.toString());
              }
            },
            child: Text("OTP"),
          ),
        ],
      ),
    );
  }
}
