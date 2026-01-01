import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class AvatarStickersScreen extends StatelessWidget {
   AvatarStickersScreen({super.key});

  final PrivacyViewController avatarController = Get.find();

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
          "Avatar stickers",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Who can feature my avatar in their stickers",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("My contacts"),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("Selected contacts..."),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("Nobody"),
              SizedBox(height: AppSize.getSize(20)),
              Text(
                "If you and a contact allow this for each other, stickers featuring your avatar with their avatar will be available in your chat.",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
            ],
          ),
        ),
      
    );
  }

  Widget radioTile(String title) {
   return Obx((){
     bool isselected = avatarController.selectedOption.value == title;
    return InkWell(
      onTap: () {
          avatarController.selectedOption.value = title;
      },
      child: Padding(
        padding: EdgeInsets.only(left: AppSize.getSize(20)),
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isselected ? AppColors.greenAccentShade700 : AppColors.greyColor,
                  width: AppSize.getSize(2),
                ),
              ),
              child: isselected
                  ? Center(
                      child: Container(
                        height: AppSize.getSize(12),
                        width: AppSize.getSize(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greenAccentShade700,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
            SizedBox(width: AppSize.getSize(15)),
            Text(title, style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18))),
          ],
        ),
      ),
    );
   });
  }
}
