import 'package:get/state_manager.dart';

class ListViewController extends GetxController{
  RxBool isOn = false.obs;
  RxString selectedOption = "Always".obs;
}