import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/provider/login_provider.dart';

class OtpProvider extends ChangeNotifier {
  bool isLoading = false;
  LoginProvider loginController;
  TextEditingController otpController = TextEditingController();

  OtpProvider(this.loginController);
  void resetLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<bool> verifyOtp() async {
    try {
      isLoading = true;
      notifyListeners();

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: loginController.verificationId,
        smsCode: otpController.text.trim(),
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false; 
    }
  }
}
