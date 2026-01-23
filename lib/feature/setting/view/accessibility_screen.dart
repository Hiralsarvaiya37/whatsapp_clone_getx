import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/view/animation_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AccessibilityScreen extends GetView<SettingController> {
  static const id ="/AccessibilityScreen";
  const AccessibilityScreen({super.key});


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
         context.l10n.accessibility,
          style: TextStyle(
            color: AppTheme.whiteColor,
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
                          context.l10n.increasecontrast,
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          context.l10n.darkenkeycolorstomakethingseasiertoseewhileinlightmode,
                          style: TextStyle(
                            color: AppTheme.greyShade400,
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
                      activeThumbColor: AppTheme.blackColor,
                      activeTrackColor: AppTheme.greenAccentShade700,
                      inactiveTrackColor: AppTheme.blackColor,
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
                    context.l10n.animation,
                    style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: AppSize.getSize(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    context.l10n.choosewhetherstickersandGIFsmoveautomatically,
                    style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
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
