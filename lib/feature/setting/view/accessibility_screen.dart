import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/view/animation_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class AccessibilityScreen extends GetView<SettingController> {
  static const id ="/AccessibilityScreen";
  const AccessibilityScreen({super.key});


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
          "Accessibility",
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
                  controller.isOn.value = !controller.isOn.value;
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Increase contrast",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Darken key colors to make things easier to see while in light mode.",
                          style: TextStyle(
                            color: AppColors.greyShade400,
                            fontSize: AppSize.getSize(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSize.getSize(15)),
                  Obx(
                    ()=> Switch(
                      value: controller.isOn.value,
                      activeThumbColor: AppColors.blackColor,
                      activeTrackColor: AppColors.greenAccentShade700,
                      inactiveTrackColor: AppColors.blackColor,
                      onChanged: (val) {
                          controller.isOn.value = val;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.getSize(40)),
            InkWell(
              onTap: () {
               Get.toNamed(AnimationScreen.id);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Animation",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: AppSize.getSize(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Choose whether stickers and GIFs move automatically.",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
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
