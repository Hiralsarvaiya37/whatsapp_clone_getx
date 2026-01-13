import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/controller/help_and_feedback_view_controller.dart';

class HelpAndFeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  HelpAndFeedbackViewController());
  }
}