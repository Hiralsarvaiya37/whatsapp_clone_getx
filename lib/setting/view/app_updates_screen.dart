import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class AppUpdatesScreen extends StatelessWidget {
   AppUpdatesScreen({super.key});

 final SettingController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25)),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: AppSize.getSize(30)),
          child: Text(
            "App update settings",
            style: TextStyle(fontSize: AppSize.getSize(20), fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "App updates",
              style: TextStyle(fontSize: AppSize.getSize(20), fontWeight: FontWeight.w600),
            ),
            SizedBox(height: AppSize.getSize(30)),
            Obx(
              ()=> appInfo(
                "Auto-update WhatsApp",
                "Automatically download app updates.",
                appController.isShow1.value,
                (val) {
                    appController.isShow1.value = val;
                },
              ),
            ),
            SizedBox(height: AppSize.getSize(25)),
            Obx(
              ()=> appInfo(
                "Allow updates over any network",
                "Download updates using mobile data when Wi-Fi is not available. Data charges may apply.",
                appController.isShow2.value,
                (val) {
                    appController.isShow2.value = val;
                },
              ),
            ),
            SizedBox(height: AppSize.getSize(35)),
            Text(
              "Notifications",
              style: TextStyle(fontSize: AppSize.getSize(20), fontWeight: FontWeight.w600),
            ),
            SizedBox(height: AppSize.getSize(25)),
            Obx(
              ()=> appInfo(
                "WhatsApp update available",
                "Get notified when updates are available.",
                appController.isShow3.value,
                (val) {
                    appController.isShow3.value = val;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appInfo(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return InkWell(
      onTap: () {
       onChanged(!value);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: AppSize.getSize(18), fontWeight: FontWeight.w500),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: AppSize.getSize(16), color: AppColors.greyShade800),
                ),
              ],
            ),
          ),
           Switch(
              value: value,
              activeThumbColor: AppColors.blueshade900,
              activeTrackColor: AppColors.blueshade100,
              inactiveTrackColor: AppColors.greyShade400,
              inactiveThumbColor: AppColors.whiteColor,
              onChanged: onChanged,
            ),
        ],
      ),
    );
  }
}
