import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/controller/updateview_controller.dart';

class UpdateBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<UpdateviewController>(() => UpdateviewController());
  }
}