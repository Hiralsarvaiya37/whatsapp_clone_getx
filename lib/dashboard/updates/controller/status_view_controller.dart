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

  final Rx<VideoPlayerController?> videoController = Rx<VideoPlayerController?>(
    null,
  );

  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    _loadStatus(0);
  }

  void _loadStatus(int index) async {
    progressController?.dispose();
    videoController.value?.dispose();
    videoController.value = null;

    currentIndex.value = index;
    final item = statusList[index];

    if (item.type == StatusType.image) {
      progressController =
          AnimationController(vsync: this, duration: const Duration(seconds: 3))
            ..addListener(update)
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                nextStatus();
              }
            })
            ..forward();
    } else {
      final vc = VideoPlayerController.file(item.file);
      await vc.initialize();
      vc.play();

      videoController.value = vc;

      progressController =
          AnimationController(vsync: this, duration: vc.value.duration)
            ..addListener(update)
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                nextStatus();
              }
            })
            ..forward();
    }

    update();
  }

  void onPageChanged(int index) {
    _loadStatus(index);
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

  @override
  void onClose() {
    progressController?.dispose();
    videoController.value?.dispose();
    pageController.dispose();
    super.onClose();
  }
}
