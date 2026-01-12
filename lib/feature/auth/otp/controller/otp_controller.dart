import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/view/dashboard_screen.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/controller/login_controller.dart';

class OtpController extends GetxController {
  LoginController loginController = Get.find();
  TextEditingController otpController = TextEditingController();

  void onOtpPress() {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: loginController.verificationId,
        smsCode: otpController.text.toString(),
      );
      FirebaseAuth.instance.signInWithCredential(credential).then((
        value,
      ) async {
        //  String uuid = Uuid().v4();

        // FirestoreHelper firestoreHelper = FirestoreHelper();

        //                 await firestoreHelper.addNewUser(
        //     uuid: uuid,
        //     name: "nameCtr.text",
        //     emailOrNum: phoneController.text,
        //     onError: () {},
        //     sucess: () {
        //       ///GEt storge

              Get.toNamed(DashboardScreen.id);
        //     },
        //   );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DashboardScreen()),
        // );
      });
    } catch (ex) {
      log(ex.toString());
    }
  }
}
