import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/controller/accessibility_view_controller.dart';

class AccessibiityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  AccessibilityViewController());
  }
}