import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/controller/accessibility_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AnimationScreen extends GetView<AccessibilityViewController> {
  static const id = "/AnimationScreen";
  const AnimationScreen({super.key});

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
          context.l10n.animation,
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
            Text(
              context.l10n.whenturnedonemojistickersorGIFswillmoveautomatically,
              style: TextStyle(color: AppTheme.greyShade400, fontSize: 16),
            ),
            SizedBox(height: AppSize.getSize(30)),
            appTile(context.l10n.emoji, Icons.emoji_emotions_outlined, 1),
            SizedBox(height: AppSize.getSize(20)),
            appTile(context.l10n.stickers, Icons.sticky_note_2_outlined, 2),
            SizedBox(height: AppSize.getSize(20)),
            appTile(context.l10n.gifs, Icons.gif, 3),
          ],
        ),
      ),
    );
  }

  Widget appTile(String title, IconData icon, int index) {
   return Obx((){
     bool currentValue;
    if (index == 1) {
      currentValue = controller.isOn1.value;
    } else if (index == 2) {
      currentValue = controller.isOn2.value;
    } else {
      currentValue = controller.isOn3.value;
    }
    return InkWell(
      onTap: () {
          if (index == 1) {
            controller.isOn1.value = !controller.isOn1.value;
          } else if (index == 2) {
            controller.isOn2.value = !controller.isOn2.value;
          } else {
            controller.isOn3.value = !controller.isOn3.value;
          }
      },
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(icon, size: AppSize.getSize(30), color: AppTheme.whiteColor),
                SizedBox(width: AppSize.getSize(20)),
                Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontSize: AppSize.getSize(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
         
             Switch(
              value: currentValue,
              activeThumbColor: AppTheme.blackColor,
              activeTrackColor: AppTheme.greenAccentShade700,
              inactiveTrackColor: AppTheme.blackColor,
              onChanged: (val) {
                  if (index == 1) {
                    controller.isOn1.value = val;
                  } else if (index == 2) {
                    controller.isOn2.value = val;
                  } else {
                    controller.isOn3.value = val;
                  }
              },
            ),
          
        ],
      ),
    );
   });
  }
}
