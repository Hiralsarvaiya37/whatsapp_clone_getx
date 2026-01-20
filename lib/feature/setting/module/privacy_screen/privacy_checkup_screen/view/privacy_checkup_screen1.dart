import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/calls_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/groups_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/privacy_contacts_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PrivacyCheckupScreen1 extends StatelessWidget {
  static const id = "/PrivacyCheckupScreen1";
  const PrivacyCheckupScreen1({super.key});

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          "Privacy checkup",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.getSize(20)),
            Icon(
              Icons.people_sharp,
              size: AppSize.getSize(70),
              color: AppTheme.greenAccentShade700,
            ),
            SizedBox(height: AppSize.getSize(30)),
            Text(
              "Choose who can contact you",
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: AppSize.getSize(22),
              ),
            ),
            SizedBox(height: AppSize.getSize(20)),
            Text(
              "You're control of your privacy. Choose who can contact you and stop unwanted calls or messages.",
              style: TextStyle(color: AppTheme.greyShade400, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.getSize(35)),
            appInfo(
              "Groups",
              "Decide if you want everyone to add you to groups or just your contacts",
              Icons.group_add_sharp,
              () {
                Get.toNamed(GroupsScreen.id);
              },
            ),
            SizedBox(height: AppSize.getSize(30)),
            appInfo(
              "Silence unknown callers",
              "Prevent calls from unknown contacts.",
              Icons.notifications_off_outlined,
              () {
                Get.toNamed(CallsScreen.id);
              },
            ),
            SizedBox(height: AppSize.getSize(30)),
            appInfo(
              "Blocked contacts",
              "Stop receiving calls, messages and status updates from selected contacts.",
              Icons.person_off_outlined,
              () {
                Get.toNamed(PrivacyContactsScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget appInfo(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: AppSize.getSize(30), color: AppTheme.greyShade400),
          SizedBox(width: AppSize.getSize(20)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontSize: AppSize.getSize(18),
                  ),
                ),
                SizedBox(height: AppSize.getSize(5)),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppTheme.greyShade400,
                    fontSize: AppSize.getSize(16),
                  ),
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: AppSize.getSize(47)),
          Icon(
            Icons.arrow_forward,
            size: AppSize.getSize(25),
            color: AppTheme.greyShade400,
          ),
        ],
      ),
    );
  }
}
