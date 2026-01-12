import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  DashboardController());
  }
}