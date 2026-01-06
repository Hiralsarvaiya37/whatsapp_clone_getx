import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/dashboard/calls/controller/call_controller.dart';
import 'package:whatsapp_clone_getx/setting/accessibility/controller/accessibility_view_controller.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/controller/account_view_controller.dart';
import 'package:whatsapp_clone_getx/setting/chats_screen/controller/chat_view_controller.dart';
import 'package:whatsapp_clone_getx/setting/help_and_feedback/controller/help_and_feedback_view_controller.dart';
import 'package:whatsapp_clone_getx/setting/lists_screen/controller/list_view_controller.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/controller/privacy_view_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<CallController>(()=>CallController());
    Get.lazyPut<AccountViewController>(()=>AccountViewController());
    Get.lazyPut<PrivacyViewController>(()=>PrivacyViewController());
    Get.lazyPut<ListViewController>(()=>ListViewController());
    Get.lazyPut<ChatViewController>(()=>ChatViewController());
    Get.lazyPut<AccessibilityViewController>(()=>AccessibilityViewController());
    Get.lazyPut<HelpAndFeedbackViewController>(()=>HelpAndFeedbackViewController());
  }
}