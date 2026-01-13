import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/controller/list_view_controller.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  ListViewController());
  }
}