import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/controller/account_view_controller.dart';

class AccountViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  AccountViewController());
  }
}