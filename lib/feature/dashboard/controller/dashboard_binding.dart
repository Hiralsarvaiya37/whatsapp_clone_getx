import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/controller/dashboard_controller.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/controller/chat_controller.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/controller/updateview_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  DashboardController());
    Get.lazyPut(()=> UpdateviewController());
    Get.lazyPut(()=> ChatController());
  }
}