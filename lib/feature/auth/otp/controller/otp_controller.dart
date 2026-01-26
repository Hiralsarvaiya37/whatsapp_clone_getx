import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/controller/login_controller.dart';
import 'package:whatsapp_clone_getx/feature/splash/view/splash_screen.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class OtpController extends GetxController {
  RxBool isLoading = false.obs;
  LoginController loginController = Get.find();
  TextEditingController otpController = TextEditingController();
  void onOtpPress() async {
    try {
      isLoading.value = true;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: loginController.verificationId,
        smsCode: otpController.text.trim(),
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAllNamed(SplashScreen.id);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "OTP Error",
        e.message ?? "Invalid OTP",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.redColor,
        colorText: AppTheme.whiteColor,
      );
    }catch (e) {
      isLoading.value = false; 
    }
  }
}
