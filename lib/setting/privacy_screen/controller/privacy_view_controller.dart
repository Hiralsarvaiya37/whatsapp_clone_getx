import 'package:get/state_manager.dart';

class PrivacyViewController extends GetxController{
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