import 'dart:io';
import 'package:flutter/material.dart';

enum StatusType { image, video }

class StatusItem {
  final File file;
  final StatusType type;

  StatusItem({required this.file, required this.type});
}

class UpdateviewProvider extends ChangeNotifier {
  bool isArrowDown = true;
  bool isDown = true;
  List<StatusItem> statusList = <StatusItem>[];

  void addImage(File file) {
    statusList.add(StatusItem(file: file, type: StatusType.image));
    notifyListeners();
  }

  void addVideo(File file) {
    statusList.add(StatusItem(file: file, type: StatusType.video));
    notifyListeners();
  }

  void toggleArrow() {
    isArrowDown = !isArrowDown;
    notifyListeners();
  }

  void toggleDown() {
    isDown = !isDown;
    notifyListeners();
  }
}
