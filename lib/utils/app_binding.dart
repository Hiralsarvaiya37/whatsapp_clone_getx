import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/controller/account_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/controller/chat_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/controller/help_and_feedback_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/controller/list_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountViewController>(() => AccountViewController());
    Get.lazyPut<PrivacyViewController>(() => PrivacyViewController());
    Get.lazyPut<ListViewController>(() => ListViewController());
    Get.lazyPut<ChatViewController>(() => ChatViewController());
    Get.lazyPut<HelpAndFeedbackViewController>(
      () => HelpAndFeedbackViewController(),
    );
  }
}
