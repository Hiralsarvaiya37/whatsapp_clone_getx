import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/view/otp_screen.dart';

class LoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  String verificationId  = "";

  Future<void> onVerifyNum(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text.trim()}",
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException ex) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(ex.message ?? "Verification failed"),
          ),
        );
      },
      codeSent: (String verifyId, int? resendToken) {
        verificationId= verifyId;
        Get.toNamed(OtpScreen.id);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
