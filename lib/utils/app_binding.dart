import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/controller/call_controller.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/controller/updateview_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/controller/account_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/controller/accessibility_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/controller/chat_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/controller/help_and_feedback_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/controller/list_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_controller.dart';

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
    Get.lazyPut<UpdateviewController>(()=>UpdateviewController());
  }
}