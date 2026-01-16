import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/view/dashboard_screen.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/controller/login_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';

class OtpController extends GetxController {
  LoginController loginController = Get.find();
  TextEditingController otpController = TextEditingController();

  // void onOtpPress() {
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: loginController.verificationId,
  //       smsCode: otpController.text.toString(),
  //     );
  //     FirebaseAuth.instance.signInWithCredential(credential).then((
  //       value,
  //     ) async {
  //       //  String uuid = Uuid().v4();

  //       // FirestoreHelper firestoreHelper = FirestoreHelper();

  //       //                 await firestoreHelper.addNewUser(
  //       //     uuid: uuid,
  //       //     name: "nameCtr.text",
  //       //     emailOrNum: phoneController.text,
  //       //     onError: () {},
  //       //     sucess: () {
  //       //       ///GEt storge

  //             Get.offAllNamed(DashboardScreen.id);
  //       //     },
  //       //   );
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(builder: (context) => DashboardScreen()),
  //       // );
  //     });
  //   } catch (ex) {
  //     log(ex.toString());
  //   }
  // }

  void onOtpPress() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: loginController.verificationId,
        smsCode: otpController.text.trim(),
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAllNamed(DashboardScreen.id);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "OTP Error",
        e.message ?? "Invalid OTP",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.redColor,
        colorText: AppColors.whiteColor,
      );
    }
  }
}
