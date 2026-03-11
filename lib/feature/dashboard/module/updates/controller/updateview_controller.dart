import 'dart:io';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

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
  final box = GetStorage();

  void addImage(File file) {
    statusList.add(
      StatusItem(file: file, type: StatusType.image),
    );
     saveStatus();
  }

  void addVideo(File file) {
    statusList.add(
      StatusItem(file: file, type: StatusType.video),
    );
     saveStatus();
  }
  void saveStatus() {
  List<Map<String, dynamic>> data = statusList.map((e) {
    return {
      "path": e.file.path,
      "type": e.type.name,
    };
  }).toList();

  box.write("status", data);
}
void loadStatus() {
  final data = box.read("status");

  if (data != null) {
    statusList.value = List<Map<String, dynamic>>.from(data).map((e) {
      return StatusItem(
        file: File(e["path"]),
        type: e["type"] == "image"
            ? StatusType.image
            : StatusType.video,
      );
    }).toList();
  }
}
@override
void onInit() {
  super.onInit();
  loadStatus();
}
}


