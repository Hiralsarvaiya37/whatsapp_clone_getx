import 'package:get/state_manager.dart';

class ChatViewController extends GetxController{
  RxBool isOn1 = false.obs;
  RxBool isOn2 = false.obs;
  RxBool isArchived = false.obs;
  RxBool deleteMedia = false.obs;
  RxInt selectedDeleteOption = 0.obs;
  RxString selectedGoogleAccount = "None selected".obs;
  RxString backupFrequency = "Off".obs;
}