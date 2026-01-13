// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/controller/status_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/controller/updateview_controller.dart';

class StatusViewScreen extends StatelessWidget {
  static const id = "/StatusViewScreen";
  final List<StatusItem> statusList;

  const StatusViewScreen({super.key, required this.statusList});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatusViewController>(
      init: StatusViewController(statusList),
      autoRemove: true,
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                itemCount: statusList.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  final item = statusList[index];

                  if (item.type == StatusType.image) {
                    return Center(
                      child: Image.file(item.file, fit: BoxFit.contain),
                    );
                  }

                  return Obx(() {
                    final video = controller.videoController.value;

                    if (video == null || !video.value.isInitialized) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    return Center(
                      child: AspectRatio(
                        aspectRatio: video.value.aspectRatio,
                        child: VideoPlayer(video),
                      ),
                    );
                  });
                },
              ),

              Positioned(
                top: 40,
                left: 8,
                right: 8,
                child: Row(
                  children: List.generate(statusList.length, (index) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: index < controller.currentIndex.value
                              ? 1
                              : index == controller.currentIndex.value
                              ? controller.progressController?.value ?? 0
                              : 0,
                          child: Container(color: Colors.white),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              Positioned(
                top: 35,
                left: 5,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
