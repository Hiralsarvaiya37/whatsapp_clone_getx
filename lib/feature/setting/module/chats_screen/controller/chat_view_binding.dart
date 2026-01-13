import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/controller/chat_view_controller.dart';

class ChatViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  ChatViewController());
  }
}