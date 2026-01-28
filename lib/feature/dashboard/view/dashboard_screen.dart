import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/callsview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/scheduled_calls/view/scheduled_calls_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/chatview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/payments/view/payment_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/communities/view/communitiesview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/controller/dashboard_controller.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/view/updateview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/link_devices/view/link_devices_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/new_community/view/new_community_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/status_privacy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/broadcasts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/setting_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/starred/view/starred_screen.dart';
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
                                handleMenuClick(value);
                              },
                              itemBuilder: (context) => [
                                popupTile(context.l10n.newgroup, 1),
                                popupTile(context.l10n.newcommunity, 9),
                                popupTile(context.l10n.broadcastlists, 10),
                                popupTile(context.l10n.linkeddevices, 11),
                                popupTile(context.l10n.starred, 12),
                                popupTile(context.l10n.payments, 16),
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
                                handleMenuClick(value);
                                if (value == 15) {
                                  bottomSheet(context);
                                }
                              },
                              itemBuilder: (context) => [
                                popupTile(context.l10n.createchannel, 15),
                                popupTile(context.l10n.statusprivacy, 14),
                                popupTile(context.l10n.starred, 12),
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
                                handleMenuClick(value);
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
                                handleMenuClick(value);
                                if (value == 17) {
                                  showClearCallLogDialog(context);
                                }
                              },
                              itemBuilder: (context) => [
                                popupTile(context.l10n.clearcalllog, 17),
                                popupTile(context.l10n.scheduledcalls, 13),
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

  void showClearCallLogDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.greyShade900,
          content: Text(
            "Do you want to clear your entire call log?",
            style: TextStyle(color: AppTheme.greyShade400, fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: AppTheme.greenAccentShade700,
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Ok",
                style: TextStyle(
                  color: AppTheme.greenAccentShade700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget bottomOption(String title, IconData icon, int index) {
    return Obx(() {
      final isActive = controller.currentIndex.value == index;

      return GestureDetector(
        onTap: () {
          controller.changeIndex(index);
          pageController.jumpToPage(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSize.getSize(8),
                horizontal: AppSize.getSize(10),
              ),
              decoration: BoxDecoration(
                color: isActive ? AppTheme.greenshade900 : AppTheme.blackColor,
                borderRadius: BorderRadius.circular(AppSize.getSize(15)),
              ),
              child: Icon(
                icon,
                color: isActive ? AppTheme.greyShade400 : AppTheme.whiteColor,
                size: AppSize.getSize(30),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: AppSize.getSize(15),
              ),
            ),
          ],
        ),
      );
    });
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

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.greyShade900,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.73,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.getSize(20),
              vertical: AppSize.getSize(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: AppSize.getSize(6),
                  width: AppSize.getSize(40),
                  decoration: BoxDecoration(
                    color: AppTheme.greyShade400,
                    borderRadius: BorderRadius.circular(AppSize.getSize(10)),
                  ),
                ),
                SizedBox(height: AppSize.getSize(25)),
                Icon(
                  Icons.wifi_tethering_sharp,
                  size: AppSize.getSize(55),
                  color: AppTheme.greenAccentShade700,
                ),
                SizedBox(height: AppSize.getSize(15)),
                Text(
                  "Create a channel to reach unlimited followers",
                  style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.getSize(24),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSize.getSize(15)),
                appTitle(
                  Icons.public,
                  "Anyone can discover your channel",
                  "Channels are public, so anyone can find them and see 30 days of history.",
                ),
                appTitle(
                  Icons.visibility_off_outlined,
                  "People see your channel, not you",
                  "Followers can't see your phone number, profile picture or name, but other admins can.",
                ),
                appTitle(
                  Icons.shield_outlined,
                  "You're responsible for your channel",
                  "Your channel needs to follow our guidelines and is reviewed against them.",
                ),
                SizedBox(height: AppSize.getSize(25)),
                Text.rich(
                  TextSpan(
                    text: "By continuing you agree to the WhatsApp",
                    style: TextStyle(color: AppTheme.greyShade500),
                    children: [
                      TextSpan(
                        text: "Channels Terms ",
                        style: TextStyle(color: AppTheme.blueshade500),
                      ),
                      TextSpan(
                        text: "and ",
                        style: TextStyle(color: AppTheme.greyShade500),
                      ),
                      TextSpan(
                        text: "Privacy Policy.Learn more",
                        style: TextStyle(color: AppTheme.blueshade500),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSize.getSize(20)),
                Container(
                  height: AppSize.getSize(40),
                  decoration: BoxDecoration(
                    color: AppTheme.greenAccentShade700,
                    borderRadius: BorderRadius.circular(AppSize.getSize(30)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Agree and continue",
                    style: TextStyle(
                      fontSize: AppSize.getSize(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appTitle(IconData iconData, String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.getSize(10)),
      child: Row(
        children: [
          Icon(
            iconData,
            size: AppSize.getSize(30),
            color: AppTheme.greyShade400,
          ),
          SizedBox(width: AppSize.getSize(30)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontSize: AppSize.getSize(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppTheme.greyShade500,
                    fontSize: AppSize.getSize(16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void handleMenuClick(int value) {
    switch (value) {
      case 9:
        Get.toNamed(NewCommunityScreen.id);
        break;
      case 8:
        Get.toNamed(SettingScreen.id);
        break;
      case 10:
        Get.toNamed(BroadcastsScreen.id);
        break;
      case 11:
        Get.toNamed(LinkDevicesScreen.id);
        break;
      case 12:
        Get.toNamed(StarredScreen.id);
        break;
      case 13:
        Get.toNamed(ScheduledCallsScreen.id);
        break;
      case 14:
        Get.toNamed(StatusPrivacyScreen.id);
        break;
      case 16:
        Get.toNamed(PaymentScreen.id);
        break;
    }
  }
}
