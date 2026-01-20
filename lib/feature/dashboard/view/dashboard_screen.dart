import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/callsview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/chatview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/communities/view/communitiesview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/controller/dashboard_controller.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/view/updateview_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/setting_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class DashboardScreen extends GetView<DashboardController> {
  static const id = "/DashboardScreen";
  DashboardScreen({super.key});

  final pageController = PageController();

  final DashboardController dashboardController = Get.put(
    DashboardController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: AppSize.getSize(35),
          left: AppSize.getSize(15),
          right: AppSize.getSize(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => Text(
                      dashboardController.getAppBarName(
                        dashboardController.currentIndex.value,
                      ),
                      style: TextStyle(
                        color: AppTheme.whiteColor,
                        fontSize: AppSize.getSize(25),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => dashboardController.currentIndex.value == 0
                      ? Row(
                          children: [
                            Icon(
                              Icons.qr_code,
                              color: AppTheme.whiteColor,
                              size: AppSize.getSize(30),
                            ),

                            SizedBox(width: AppSize.getSize(25)),
                            Icon(
                              Icons.camera_alt_outlined,
                              color: AppTheme.whiteColor,
                              size: AppSize.getSize(30),
                            ),
                            PopupMenuButton(
                              color: AppTheme.greyShade900,
                              offset: Offset(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSize.getSize(10),
                                ),
                              ),
                              icon: Icon(
                                Icons.more_vert,
                                color: AppTheme.whiteColor,
                                size: AppSize.getSize(30),
                              ),
                              onSelected: (value) {
                                if (value == 8) {
                                  Get.toNamed(SettingScreen.id);
                                }
                              },
                              itemBuilder: (context) => [
                                popupTile("New group", 1),
                                popupTile("New community", 2),
                                popupTile("Broadcast lists", 3),
                                popupTile("Linked devices", 4),
                                popupTile("Starred", 5),
                                popupTile("Payments", 6),
                                popupTile("Read all", 7),
                                popupTile("Settings", 8),
                              ],
                            ),
                          ],
                        )
                      : dashboardController.currentIndex.value == 1
                      ? Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: AppTheme.whiteColor,
                              size: AppSize.getSize(30),
                            ),
                            SizedBox(width: AppSize.getSize(15)),
                            PopupMenuButton(
                              color: AppTheme.greyShade900,
                              offset: Offset(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSize.getSize(10),
                                ),
                              ),
                              icon: Icon(
                                Icons.more_vert,
                                color: AppTheme.whiteColor,
                                size: AppSize.getSize(30),
                              ),
                              onSelected: (value) {
                                if (value == 8) {
                                  Get.toNamed(SettingScreen.id);
                                }
                              },
                              itemBuilder: (context) => [
                                popupTile("Create channel", 1),
                                popupTile("Status privacy", 2),
                                popupTile("Starred", 3),
                                popupTile("Settings", 8),
                              ],
                            ),
                          ],
                        )
                      : dashboardController.currentIndex.value == 2
                      ? Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: AppTheme.whiteColor,
                              size: AppSize.getSize(30),
                            ),
                            SizedBox(width: AppSize.getSize(15)),
                            PopupMenuButton(
                              color: AppTheme.greyShade900,
                              offset: Offset(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSize.getSize(10),
                                ),
                              ),
                              icon: Icon(
                                Icons.more_vert,
                                color: AppTheme.whiteColor,
                                size: AppSize.getSize(30),
                              ),
                              onSelected: (value) {
                                if (value == 8) {
                                  Get.toNamed(SettingScreen.id);
                                }
                              },
                              itemBuilder: (context) => [
                                popupTile("Settings", 8),
                              ],
                            ),
                          ],
                        )
                      : dashboardController.currentIndex.value == 3
                      ? Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: AppTheme.whiteColor,
                              size: AppSize.getSize(30),
                            ),
                            SizedBox(width: AppSize.getSize(15)),
                            PopupMenuButton(
                              color: AppTheme.greyShade900,
                              offset: Offset(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSize.getSize(10),
                                ),
                              ),
                              icon: Icon(
                                Icons.more_vert,
                                color: AppTheme.whiteColor,
                                size: AppSize.getSize(30),
                              ),
                              onSelected: (value) {
                                if (value == 8) {
                                  Get.toNamed(SettingScreen.id);
                                }
                              },
                              itemBuilder: (context) => [
                                popupTile("Clear call log", 1),
                                popupTile("Scheduled calls", 2),
                                popupTile("Settings", 8),
                              ],
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ChatviewScreen(),
                  UpdateviewScreen(),
                  CommunitiesviewScreen(),
                  CallsviewScreen(),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: AppSize.getSize(70),
        color: AppTheme.blackColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomOption("Chats", Icons.chat, 0),
            bottomOption("Updates", Icons.update, 1),
            bottomOption("Communities", Icons.groups_2_outlined, 2),
            bottomOption("Calls", Icons.call, 3),
          ],
        ),
      ),
    );
  }

  Widget bottomOption(String title, IconData iconData, int page) {
    return GestureDetector(
      onTap: () {
        dashboardController.changeIndex(page);

        pageController.animateToPage(
          page,
          duration: Duration(milliseconds: 100),
          curve: Curves.bounceOut,
        );
      },
      child: Container(
        color: AppTheme.blackColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: AppSize.getSize(30),
              color: AppTheme.whiteColor,
            ),
            Text(
              title,
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: AppSize.getSize(16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem popupTile(String title, int value) {
    return PopupMenuItem(
      value: value,
      child: Text(
        title,
        style: TextStyle(
          color: AppTheme.whiteColor,
          fontSize: AppSize.getSize(17),
        ),
      ),
    );
  }
}
