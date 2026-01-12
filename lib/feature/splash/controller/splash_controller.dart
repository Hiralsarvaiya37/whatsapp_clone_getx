import 'dart:async';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/view/dashboard_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), () {
      // Get.offAllNamed(LoginScreen.id);
      Get.offAllNamed(DashboardScreen.id);
    });
  }
}
