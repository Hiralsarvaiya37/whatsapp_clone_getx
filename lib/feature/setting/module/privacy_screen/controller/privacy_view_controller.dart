import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/controller/setting_controller.dart';

class PrivacyViewController extends GetxController{
  final SettingController settingController = Get.find();

  RxString selectedlastSeen = "Nobody".obs;
  RxString selectedonline = "Everyone".obs;
  RxString selectedOption = "".obs;
  RxBool isOn = false.obs;
  RxBool isOn1 = false.obs;
  RxBool isOn2 = false.obs;
  RxBool isOn3 = false.obs;
  RxBool isYes = false.obs;
  RxBool isNo = false.obs;
}