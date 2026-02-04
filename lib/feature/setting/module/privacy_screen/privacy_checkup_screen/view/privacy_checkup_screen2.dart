import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/lastseen_and_online_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/profile_photo_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/privacy_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PrivacyCheckupScreen2 extends StatelessWidget {
  static const id = "/PrivacyCheckupScreen2";
  const PrivacyCheckupScreen2({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return Scaffold(
      backgroundColor: theme.blackColor,
      appBar: AppBar(
        backgroundColor: theme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          iconSize: AppSize.getSize(25),
          color: theme.whiteColor,
        ),
        title: Text(
          "Privacy checkup",
          style: TextStyle(
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
            color: theme.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.getSize(20)),
            Icon(
              Icons.manage_search,
              size: AppSize.getSize(80),
              color: theme.greenAccentShade700,
            ),
            SizedBox(height: AppSize.getSize(30)),
            Text(
              "Control your personal info",
              style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(22)),
            ),
            SizedBox(height: AppSize.getSize(15)),
            Text(
              "Choose the best audience for your personal info, like online status and acticity.",
              style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: AppSize.getSize(35)),
            appInfo(
              "Profile photo",
              "Choose who can view your profile photo.",
              Icons.account_circle_outlined,
              () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePhotoScreen()));
              },context
            ),
            SizedBox(height: 30),
            appInfo(
              "Last seen and online",
              "Control who can see your online status.",
              Icons.remove_red_eye_outlined,
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LastseenAndOnlineScreen()));
              },context
            ),
            SizedBox(height: AppSize.getSize(30)),
            appInfo(
              "Read receipts",
              "When turned on, others will see when you've viewed their message.",
              Icons.done_all_outlined,
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyScreen()));
              },context
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
    BuildContext context
  ) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: AppSize.getSize(30), color: theme.greyShade400),
          SizedBox(width: AppSize.getSize(20)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(18)),
                ),
                SizedBox(height: AppSize.getSize(5)),
                Text(
                  subtitle,
                  style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
                ),
              ],
            ),
          ),
          SizedBox(width: 40),
          Icon(Icons.arrow_forward, size: AppSize.getSize(25), color: theme.greyShade400),
        ],
      ),
    );
  }
}
