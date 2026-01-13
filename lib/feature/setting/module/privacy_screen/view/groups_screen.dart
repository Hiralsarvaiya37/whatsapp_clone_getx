import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class GroupsScreen extends GetView<PrivacyViewController> {
  static const id = "/GroupsScreen";
const  GroupsScreen({super.key});


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
          "Groups",
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
                "Who can add me to groups",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("Everyone"),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("My contacts"),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("My contacts except..."),
              SizedBox(height: AppSize.getSize(20)),

              Text(
                "Admins who can't add you to a group will have the option of inviting you privately instead.",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(25)),
              Text(
                "This setting does not apply to community announcement groups. if you're added to a community, you'll always be added to a community announcement group.",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
            ],
          ),
        ),
      
    );
  }

  Widget radioTile(String title) {
   return Obx((){
     bool isSelect = controller.selectedOption.value == title;
    return InkWell(
      onTap: () {
        controller.selectedOption.value = title;
      },
      child: Padding(
        padding: EdgeInsets.only(left: AppSize.getSize(20)),
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelect ? AppColors.greenAccentShade700 : AppColors.greyColor,
                  width: AppSize.getSize(2),
                ),
                shape: BoxShape.circle,
              ),
              child: isSelect
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
