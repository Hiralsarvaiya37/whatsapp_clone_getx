import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/controller/accessibility_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/controller/help_and_feedback_view_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<AccessibilityViewController>(()=>AccessibilityViewController());
    Get.lazyPut<HelpAndFeedbackViewController>(()=>HelpAndFeedbackViewController());
  }
}