// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class AccountViewController extends GetxController {
 
  RxBool isNotificationOn = false.obs;
  RxBool isYes = false.obs;
  RxBool isOn = false.obs;
  RxBool isNo = false.obs;
  RxInt selectedOption = (-1).obs;
  RxList<String> options = [
    "The article is confusing",
    "The information is inaccurate",
    "I need a more detailed explanation",
    "This isn't the information I'm looking for",
    "Other",
  ].obs;

  late VideoPlayerController videoController;
  RxBool isInitialized = false.obs;
  RxBool isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    initVideo();
  }

  void initVideo() async {
    videoController = VideoPlayerController.network(
      'https://www.pexels.com/download/video/11836616/', 
    );

    await videoController.initialize();
    isInitialized.value = true;
  }

  void playPause() {
    if (videoController.value.isPlaying) {
      videoController.pause();
      isPlaying.value = false;
    } else {
      videoController.play();
      isPlaying.value = true;
    }
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
