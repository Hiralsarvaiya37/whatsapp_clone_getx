import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/controller/call_controller.dart';

class CallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  CallController());
  }
}