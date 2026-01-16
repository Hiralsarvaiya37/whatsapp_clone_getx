import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/view/login_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/view/dashboard_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), () {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Get.offAllNamed(DashboardScreen.id);
      } else {
        Get.offAllNamed(LoginScreen.id);
      }
    });
  }
}
