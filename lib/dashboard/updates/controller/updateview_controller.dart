import 'dart:io';
import 'package:get/state_manager.dart';

class UpdateviewController extends GetxController {
  RxBool isArrowDown = true.obs;
  RxBool isDown = true.obs;
   Rx<File?> imageFile = Rx<File?>(null);
}
