import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/view/otp_screen.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  String verificationId = "";
  bool isLoading = false;
  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> onVerifyNum(BuildContext context) async {
    setLoading(true);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text.trim()}",
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException ex) {
        setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(ex.message ?? context.l10n.verificationfailed),
          ),
        );
      },
      codeSent: (String verifyId, int? resendToken) {
        setLoading(false);
        verificationId = verifyId;
        Navigator.pushReplacementNamed(context,OtpScreen.id);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
