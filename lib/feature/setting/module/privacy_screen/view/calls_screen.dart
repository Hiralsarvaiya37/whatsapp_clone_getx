import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class CallsScreen extends GetView<PrivacyViewController> {
  static const id = "/CallsScreen";
  const CallsScreen({super.key});


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
          "Calls",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Slience unknown callers",
                    style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                  ),
                  SizedBox(height: AppSize.getSize(10)),
                  Text(
                    "Calls from unknown numbers will be silenced. They will still be shown in the calls tab and in your notifications. ",
                    style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(LearnMoreScreen.id);
                    },
                    child: Text(
                      "Learn more",
                      style: TextStyle(
                        color: AppTheme.blueshade500,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
             ()=> Column(
                children: [
                  Switch(
                    value: controller.isOn.value,
                    activeThumbColor: AppTheme.blackColor,
                    activeTrackColor: AppTheme.greenAccentShade700,
                    inactiveTrackColor: AppTheme.blackColor,
                    onChanged: (val) {
                        controller.isOn.value = val;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
