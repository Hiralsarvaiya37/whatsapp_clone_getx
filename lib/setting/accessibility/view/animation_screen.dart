import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/setting/accessibility/controller/accessibility_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class AnimationScreen extends StatelessWidget {
   AnimationScreen({super.key});

 final AccessibilityViewController animationController = Get.find();

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
          "Animation",
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
            Text(
              "When turned on, emoji, stickers or GIFs will move automatically.",
              style: TextStyle(color: AppColors.greyShade400, fontSize: 16),
            ),
            SizedBox(height: AppSize.getSize(30)),
            appTile("Emoji", Icons.emoji_emotions_outlined, 1),
            SizedBox(height: AppSize.getSize(20)),
            appTile("Stickers", Icons.sticky_note_2_outlined, 2),
            SizedBox(height: AppSize.getSize(20)),
            appTile("Gifs", Icons.gif, 3),
          ],
        ),
      ),
    );
  }

  Widget appTile(String title, IconData icon, int index) {
   return Obx((){
     bool currentValue;
    if (index == 1) {
      currentValue = animationController.isOn1.value;
    } else if (index == 2) {
      currentValue = animationController.isOn2.value;
    } else {
      currentValue = animationController.isOn3.value;
    }
    return InkWell(
      onTap: () {
          if (index == 1) {
            animationController.isOn1.value = !animationController.isOn1.value;
          } else if (index == 2) {
            animationController.isOn2.value = !animationController.isOn2.value;
          } else {
            animationController.isOn3.value = !animationController.isOn3.value;
          }
      },
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(icon, size: AppSize.getSize(30), color: AppColors.whiteColor),
                SizedBox(width: AppSize.getSize(20)),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppSize.getSize(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
         
             Switch(
              value: currentValue,
              activeThumbColor: AppColors.blackColor,
              activeTrackColor: AppColors.greenAccentShade700,
              inactiveTrackColor: AppColors.blackColor,
              onChanged: (val) {
                  if (index == 1) {
                    animationController.isOn1.value = val;
                  } else if (index == 2) {
                    animationController.isOn2.value = val;
                  } else {
                    animationController.isOn3.value = val;
                  }
              },
            ),
          
        ],
      ),
    );
   });
  }
}
