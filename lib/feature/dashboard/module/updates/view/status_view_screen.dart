// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/controller/status_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/controller/updateview_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class StatusViewScreen extends StatelessWidget {
  static const id = "/StatusViewScreen";
  final List<StatusItem> statusList;

  const StatusViewScreen({super.key, required this.statusList});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatusViewController>(
      init: StatusViewController(statusList),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppTheme.blackColor,
          body: Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                physics: NeverScrollableScrollPhysics(),
                itemCount: statusList.length,
                itemBuilder: (context, index) {
                  final item = statusList[index];

                  if (item.type == StatusType.image) {
                    return Center(
                      child: Image.file(item.file, fit: BoxFit.contain),
                    );
                  } else {
                    return Obx(() {
                      final video = controller.videoController.value;
                      if (video == null || !video.value.isInitialized) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.whiteColor,
                          ),
                        );
                      }
                      return Center(
                        child: AspectRatio(
                          aspectRatio: video.value.aspectRatio,
                          child: VideoPlayer(video),
                        ),
                      );
                    });
                  }
                },
              ),
              Positioned.fill(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: controller.previousStatus,
                        onLongPressStart: (_) => controller.pause(),
                        onLongPressEnd: (_) => controller.resume(),
                        onLongPressCancel: () => controller.resume(),
                        behavior: HitTestBehavior.translucent,
                      ),
                    ),

                    Expanded(
                      child: GestureDetector(
                        onTap: controller.nextStatus,
                        onLongPressStart: (_) => controller.pause(),
                        onLongPressEnd: (_) => controller.resume(),
                        onLongPressCancel: () => controller.resume(),
                        behavior: HitTestBehavior.translucent,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: AppSize.getSize(40),
                left: AppSize.getSize(8),
                right: AppSize.getSize(8),
                child: Row(
                  children: List.generate(statusList.length, (index) {
                    return Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: AppSize.getSize(2),
                        ),
                        height: AppSize.getSize(3),
                        decoration: BoxDecoration(
                          color: AppTheme.whiteColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(4),
                          ),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: index < controller.currentIndex
                              ? 1
                              : index == controller.currentIndex
                              ? controller.progressController?.value ?? 0
                              : 0,
                          child: Container(color: AppTheme.whiteColor),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
