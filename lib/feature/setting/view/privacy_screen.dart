import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/about_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/advanced_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/app_lock_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/avatar_stickers_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/calls_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/chat_lock_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/default_message_timer_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/lastseen_and_online_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/links_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/live_location_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/privacy_checkup_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/privacy_contacts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/profile_photo_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/status_privacy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/groups_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PrivacyScreen extends GetView<PrivacyViewController> {
  static const id ="/PrivacyScreen";
const   PrivacyScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppTheme.whiteColor),
        ),
        title: Text(
          "Privacy",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Who can see my personal info",
                  style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
                ),
                SizedBox(height: AppSize.getSize(15)),
                appTitle(
                  "last seen and online",
                  "Nobody",
                  onTap: () {
                   Get.toNamed(LastseenAndOnlineScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Profile picture",
                  "My contacts",
                  onTap: () {
                    Get.toNamed(ProfilePhotoScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "About",
                  "Everyone",
                  onTap: () {
                    Get.toNamed(AboutScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Links",
                  "My contacts",
                  onTap: () {
                    Get.toNamed(LinksScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Status",
                  "My contacts",
                  onTap: () {
                    Get.toNamed(StatusPrivacyScreen.id);
                  },
                ),
            
                SizedBox(height: AppSize.getSize(20)),
            
                InkWell(
                  onTap: () {
                    controller.settingController .isOn.value = !controller.settingController.isOn.value;
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Read receipts",
                          style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                        ),
                      ),
                      Obx(
                       ()=> Switch(
                          value: controller.settingController.isOn.value,
                          activeThumbColor: AppTheme.blackColor,
                          activeTrackColor: AppTheme.greenAccentShade700,
                          inactiveTrackColor: AppTheme.blackColor,
                          onChanged: (val) {
                            controller.settingController.isOn.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "If turned off, you won't send or receive Read receipts. Read receipts are always sent for group chats.",
                  style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
                ),
            
                SizedBox(height: AppSize.getSize(30)),
                Text(
                  "Disappearing messages",
                  style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
                ),
            
                SizedBox(height: AppSize.getSize(15)),
                InkWell(
                  onTap: () {
                    Get.toNamed(DefaultMessageTimerScreen.id);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Default message timer",
                              style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                            ),
                            Text(
                              "Start new chats with disappearing messages set to your timer",
                              style: TextStyle(
                                color: AppTheme.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Off",
                        style: TextStyle(
                          color: AppTheme.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: AppSize.getSize(40)),
            
                appTitle(
                  "Groups",
                  "My contacts",
                  onTap: () {
                    Get.toNamed(GroupsScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Avatar stickers",
                  "My contacts",
                  onTap: () {
                    Get.toNamed(AvatarStickersScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                InkWell(
                  onTap: () {
                   Get.toNamed(LiveLocationScreen.id);
                  },
                  child: Text(
                    "Live location",
                    style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                  ),
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Calls",
                  "Silence unknown callers",
                  onTap: () {
                    Get.toNamed(CallsScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Contacts",
                  "Block contacts, WhatsApp contacts",
                  onTap: () {
                    Get.toNamed(PrivacyContactsScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "App lock",
                  "Disabled",
                  onTap: () {
                   Get.toNamed(AppLockScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                InkWell(
                  onTap: () {
                    Get.toNamed(ChatLockScreen.id);
                  },
                  child: Text(
                    "Chat lock",
                    style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    controller.settingController.isYes.value =
                        !controller.settingController.isYes.value;
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Allow camera effects",
                              style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "Use effects in the camera and video calls.",
                                    style: TextStyle(
                                      color: AppTheme.greyShade400,
                                      fontSize: AppSize.getSize(16),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Learn more",
                                    style: TextStyle(
                                      color: AppTheme.blueshade500,
                                      fontSize: AppSize.getSize(16),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                       ()=> Switch(
                          value: controller.settingController.isYes.value,
                          activeThumbColor: AppTheme.blackColor,
                          activeTrackColor: AppTheme.greenAccentShade700,
                          inactiveTrackColor: AppTheme.blackColor,
                          onChanged: (val) {
                            controller.settingController.isYes.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                   Get.toNamed(AdvancedScreen.id);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Advanced",
                        style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                      ),
                      Text(
                        "Protect IP address in calls, Disable link previews",
                        style: TextStyle(
                          color: AppTheme.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                   Get.toNamed(PrivacyCheckupScreen.id);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Privacy checkup",
                        style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                      ),
                      Text(
                        "Control your privacy and choose the right settings for you.",
                        style: TextStyle(
                          color: AppTheme.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: AppSize.getSize(20)),
              ],
            ),
          ),
        ),
      
    );
  }

  Widget appTitle(String title, String subtitle, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18))),
          Text(
            subtitle,
            style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
          ),
        ],
      ),
    );
  }
}
