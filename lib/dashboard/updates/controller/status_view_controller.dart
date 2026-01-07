// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone_getx/dashboard/updates/controller/updateview_controller.dart';

class StatusViewController extends GetxController
    with SingleGetTickerProviderMixin {
  final List<StatusItem> statusList;

  StatusViewController(this.statusList);

  late PageController pageController;
  AnimationController? progressController;
  VideoPlayerController? videoController;

  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    _loadStatus(0);
  }

  void _loadStatus(int index) async {
    progressController?.dispose();
    videoController?.dispose();

    currentIndex.value = index;
    final item = statusList[index];

    if (item.type == StatusType.image) {
      progressController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
      )
        ..addListener(update)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) nextStatus();
        })
        ..forward();
    } else {
      videoController = VideoPlayerController.file(item.file);
      await videoController!.initialize();
      videoController!.play();

      progressController = AnimationController(
        vsync: this,
        duration: videoController!.value.duration,
      )
        ..addListener(update)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) nextStatus();
        })
        ..forward();
    }

    update();
  }

  void nextStatus() {
    if (currentIndex.value < statusList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeIn,
      );
    } else {
      Get.back();
    }
  }

  void onPageChanged(int index) {
    _loadStatus(index);
  }

  @override
  void onClose() {
    progressController?.dispose();
    videoController?.dispose();
    pageController.dispose();
    super.onClose();
  }
}
