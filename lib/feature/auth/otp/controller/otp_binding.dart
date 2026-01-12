import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/controller/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  OtpController());
  }
}