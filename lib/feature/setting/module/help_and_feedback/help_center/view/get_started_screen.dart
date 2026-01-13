import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/download_and_installation_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/help_contacts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/linked_devices_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/registration_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/status_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/troubleshooting_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
class GetStartedScreen extends StatelessWidget {
  static const id = "/GetStartedScreen";
  const GetStartedScreen({super.key});

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
          "Help Center",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(Icons.search, size: AppSize.getSize(25), color: AppColors.whiteColor),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(Icons.more_vert, size: AppSize.getSize(25), color: AppColors.whiteColor),
            color: AppColors.greyShade900,
            offset: Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppSize.getSize(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get Started",
                  style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                   Get.toNamed(DownloadAndInstallationScreen.id);
                  },
                  child: appInfo("Download and installation", Icons.download),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                   Get.toNamed(RegistrationScreen.id);
                  },
                  child: appInfo("Registration", Icons.person_2),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Get.toNamed(LinkedDevicesScreen.id);
                  },
                  child: appInfo("Linked Devices", Icons.devices),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Get.toNamed(TroubleshootingScreen.id);
                  },
                  child: appInfo("Troubleshooting", Icons.help),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Get.toNamed(HelpContactsScreen.id);
                  },
                  child: appInfo("Contacts", Icons.perm_contact_cal_rounded),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Get.toNamed(StatusScreen.id);
                  },
                  child: appInfo("Status", Icons.data_saver_on_rounded),
                ),
                SizedBox(height: AppSize.getSize(30)),
              ],
            ),
          ),
        CommonContactUsButton(),
        ],
      ),
    );
  }

  Widget appInfo(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: AppSize.getSize(25), color: AppColors.greenAccentShade700),
        SizedBox(width: AppSize.getSize(25)),
        Text(
          title,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
