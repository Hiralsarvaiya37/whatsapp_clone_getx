import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/provider/login_provider.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  LoginProvider());
  }
}