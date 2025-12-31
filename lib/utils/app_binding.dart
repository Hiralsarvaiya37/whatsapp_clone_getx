import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/dashboard/calls/controller/call_controller.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/controller/account_view_controller.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/controller/privacy_view_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<CallController>(()=>CallController());
    Get.lazyPut<AccountViewController>(()=>AccountViewController());
    Get.lazyPut<PrivacyViewController>(()=>PrivacyViewController());
  }
}