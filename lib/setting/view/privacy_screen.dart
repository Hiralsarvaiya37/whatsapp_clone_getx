import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/view/about_screen.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/view/default_message_timer_screen.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/view/lastseen_and_online_screen.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/view/links_screen.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/view/profile_photo_screen.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/view/status_privacy_screen.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/view/groups_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class PrivacyScreen extends StatelessWidget {
   PrivacyScreen({super.key});

  final SettingController privacyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppColors.whiteColor),
        ),
        title: Text(
          "Privacy",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
          child: Obx(
            ()=> Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Who can see my personal info",
                  style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                ),
                SizedBox(height: AppSize.getSize(15)),
                appTitle(
                  "last seen and online",
                  "Nobody",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LastseenAndOnlineScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Profile picture",
                  "My contacts",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePhotoScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "About",
                  "Everyone",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutScreen()),
                    );
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Links",
                  "My contacts",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LinksScreen()),
                    );
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Status",
                  "My contacts",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StatusPrivacyScreen(),
                      ),
                    );
                  },
                ),
            
                SizedBox(height: AppSize.getSize(20)),
            
                InkWell(
                  onTap: () {
                    privacyController.isOn.value = !privacyController.isOn.value;
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Read receipts",
                          style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                        ),
                      ),
                      Obx(
                       ()=> Switch(
                          value: privacyController.isOn.value,
                          activeThumbColor: AppColors.blackColor,
                          activeTrackColor: AppColors.greenAccentShade700,
                          inactiveTrackColor: AppColors.blackColor,
                          onChanged: (val) {
                            privacyController.isOn.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "If turned off, you won't send or receive Read receipts. Read receipts are always sent for group chats.",
                  style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                ),
            
                SizedBox(height: AppSize.getSize(30)),
                Text(
                  "Disappearing messages",
                  style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                ),
            
                SizedBox(height: AppSize.getSize(15)),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DefaultMessageTimerScreen()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Default message timer",
                              style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                            ),
                            Text(
                              "Start new chats with disappearing messages set to your timer",
                              style: TextStyle(
                                color: AppColors.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Off",
                        style: TextStyle(
                          color: AppColors.greyShade400,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GroupsScreen()),
                    );
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Avatar stickers",
                  "My contacts",
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AvatarStickersScreen(),
                    //   ),
                    // );
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => LiveLocationScreen(),
                    //   ),
                    // );
                  },
                  child: Text(
                    "Live location",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                  ),
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Calls",
                  "Silence unknown callers",
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CallsScreen()),
                    // );
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "Contacts",
                  "Block contacts, WhatsApp contacts",
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => PrivacyContactsScreen(),
                    //   ),
                    // );
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  "App lock",
                  "Disabled",
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AppLockScreen()),
                    // );
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ChatLockScreen()),
                    // );
                  },
                  child: Text(
                    "Chat lock",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    privacyController.isYes.value =
                        !privacyController.isYes.value;
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
                              style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "Use effects in the camera and video calls.",
                                    style: TextStyle(
                                      color: AppColors.greyShade400,
                                      fontSize: AppSize.getSize(16),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Learn more",
                                    style: TextStyle(
                                      color: AppColors.blueshade500,
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
                      Switch(
                        value: privacyController.isYes.value,
                        activeThumbColor: AppColors.blackColor,
                        activeTrackColor: AppColors.greenAccentShade700,
                        inactiveTrackColor: AppColors.blackColor,
                        onChanged: (val) {
                          privacyController.isYes.value = val;
                        },
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>AdvancedScreen()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Advanced",
                        style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                      ),
                      Text(
                        "Protect IP address in calls, Disable link previews",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyCheckupScreen()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Privacy checkup",
                        style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                      ),
                      Text(
                        "Control your privacy and choose the right settings for you.",
                        style: TextStyle(
                          color: AppColors.greyShade400,
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
      ),
    );
  }

  Widget appTitle(String title, String subtitle, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18))),
          Text(
            subtitle,
            style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
          ),
        ],
      ),
    );
  }
}
