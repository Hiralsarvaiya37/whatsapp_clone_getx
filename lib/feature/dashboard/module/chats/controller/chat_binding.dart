import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/controller/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  ChatController());
  }
}