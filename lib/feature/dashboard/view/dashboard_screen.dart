import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/callsview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/chatview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/communities/view/communitiesview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/controller/dashboard_controller.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/view/updateview_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/setting_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class DashboardScreen extends GetView<DashboardController> {
  static const id = "/DashboardScreen";
  DashboardScreen({super.key});

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    AppSize.setupData(MediaQuery.of(context));

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
                      controller.getAppBarName(controller.currentIndex.value),
                      style: TextStyle(
                        color: AppTheme.whiteColor,
                        fontSize: AppSize.getSize(25),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => controller.currentIndex.value == 0
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
                                popupTile(context.l10n.newgroup, 1),
                                popupTile(context.l10n.newcommunity, 2),
                                popupTile(context.l10n.broadcastlists, 3),
                                popupTile(context.l10n.linkeddevices, 4),
                                popupTile(context.l10n.starred, 5),
                                popupTile(context.l10n.payments, 6),
                                popupTile(context.l10n.readall, 7),
                                popupTile(context.l10n.settings, 8),
                              ],
                            ),
                          ],
                        )
                      : controller.currentIndex.value == 1
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
                                popupTile(context.l10n.createchannel, 1),
                                popupTile(context.l10n.statusprivacy, 2),
                                popupTile(context.l10n.starred, 3),
                                popupTile(context.l10n.settings, 8),
                              ],
                            ),
                          ],
                        )
                      : controller.currentIndex.value == 2
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
                                popupTile(context.l10n.settings, 8),
                              ],
                            ),
                          ],
                        )
                      : controller.currentIndex.value == 3
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
                                popupTile(context.l10n.clearcalllog, 1),
                                popupTile(context.l10n.scheduledcalls, 2),
                                popupTile(context.l10n.settings, 8),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            bottomOption(context.l10n.chats, Icons.chat, 0),
            bottomOption(context.l10n.updates, Icons.update, 1),
            bottomOption(context.l10n.communities, Icons.groups_2_outlined, 2),
            bottomOption(context.l10n.calls, Icons.call, 3),
          ],
        ),
      ),
    );
  }

  Widget bottomOption(String title, IconData iconData, int page) {
    return GestureDetector(
      onTap: () {
        controller.changeIndex(page);

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
