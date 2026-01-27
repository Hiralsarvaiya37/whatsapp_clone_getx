import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_controller.dart';

class PrivacyViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyViewController(),);
    Get.lazyPut(() => SettingController(),);
  }
}