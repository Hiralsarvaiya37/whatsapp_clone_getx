import 'dart:io';
import 'package:get/state_manager.dart';

enum StatusType { image, video }

class StatusItem {
  final File file;
  final StatusType type;

  StatusItem({required this.file, required this.type});
}

class UpdateviewController extends GetxController {
    RxBool isArrowDown = true.obs;
  RxBool isDown = true.obs;
  RxList<StatusItem> statusList = <StatusItem>[].obs;

  void addImage(File file) {
    statusList.add(
      StatusItem(file: file, type: StatusType.image),
    );
  }

  void addVideo(File file) {
    statusList.add(
      StatusItem(file: file, type: StatusType.video),
    );
  }
}


