// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'updateview_controller.dart';

class StatusViewController extends GetxController
    with SingleGetTickerProviderMixin {
  final List<StatusItem> statusList;
  StatusViewController(this.statusList);

  late PageController pageController;
  AnimationController? progressController;

  final Rx<VideoPlayerController?> videoController = Rx<VideoPlayerController?>(
    null,
  );

  int currentIndex = 0;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    loadStatus(0);
  }

  bool isPaused = false;

  void pause() {
    if (isPaused) return;
    isPaused = true;
    progressController?.stop();
    videoController.value?.pause();
    update();
  }

  void resume() {
    if (!isPaused) return;
    isPaused = false;
    progressController?.forward();
    videoController.value?.play();
    update();
  }

  void loadStatus(int index) async {
    progressController?.dispose();
    videoController.value?.dispose();
    videoController.value = null;

    currentIndex = index;
    update();

    final item = statusList[index];

    if (item.type == StatusType.image) {
      progressController =
          AnimationController(vsync: this, duration: Duration(seconds: 5))
            ..addListener(update)
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                nextStatus();
              }
            })
            ..forward(from: 0);
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
            ..forward(from: 0);
    }
  }

  void onPageChanged(int index) {
    loadStatus(index);
  }

  void nextStatus() {
    if (currentIndex < statusList.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    } else {
      Get.back();
    }
  }

  void previousStatus() {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 200),
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
