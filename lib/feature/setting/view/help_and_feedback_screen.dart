import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/app_info_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/channel_reports_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/help_center_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/send_feedback_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class HelpAndFeedbackScreen extends StatelessWidget {
  static const id = "/HelpAndFeedbackScreen";
  const HelpAndFeedbackScreen({super.key});

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
          "Help",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
               Get.toNamed(HelpCenterScreen.id);
              },
              child: appInfo(
                "Help center",
                "Get help, contact us",
                Icons.help_outline_outlined,
                isShow: true,
              ),
            ),
            SizedBox(height: AppSize.getSize(30)),
            InkWell(
              onTap: () {
               Get.toNamed(SendFeedbackScreen.id);
              },
              child: appInfo(
                "Send feedback",
                "Report technical issues",
                Icons.bug_report_outlined,
                isShow: true,
              ),
            ),
            SizedBox(height: AppSize.getSize(30)),
            appInfo(
              "Terms and privacy policy",
              "",
              Icons.description_outlined,
              isShow: false,
            ),
            SizedBox(height: AppSize.getSize(30)),
            InkWell(
              onTap: () {
                Get.toNamed(ChannelReportsScreen.id);
              },
              child: appInfo(
                "Channel reports",
                "",
                Icons.feedback_outlined,
                isShow: false,
              ),
            ),
            SizedBox(height: AppSize.getSize(30)),
            InkWell(
              onTap: () {
                 Get.toNamed(AppInfoScreen.id);
              },
              child: appInfo("App info", "", Icons.info_outline, isShow: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget appInfo(
    String title,
    String subtitle,
    IconData icon, {
    bool isShow = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: AppSize.getSize(30), color: AppColors.greyColor),
        SizedBox(width: AppSize.getSize(30)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppSize.getSize(18),
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isShow && subtitle.isNotEmpty)
              Text(
                subtitle,
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
          ],
        ),
      ],
    );
  }
}
