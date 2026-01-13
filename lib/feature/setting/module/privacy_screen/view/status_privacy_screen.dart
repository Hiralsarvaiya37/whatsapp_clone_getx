import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class StatusPrivacyScreen extends GetView<PrivacyViewController> {
  static const id = "/StatusPrivacyScreen";
 const StatusPrivacyScreen({super.key});

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
          "Status Privacy",
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
                "Who can see my status updates",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
          
              radioTile("My contacts"),
              SizedBox(height: AppSize.getSize(20)),
              Row(
                children: [
                  Expanded(child: radioTile("My contacts except...")),
                  Text(
                    "0 excluded",
                    style: TextStyle(
                      color: AppColors.greenAccentShade700,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(20)),
              Row(
                children: [
                  Expanded(child: radioTile("Only share with...")),
                  Text(
                    "25 included",
                    style: TextStyle(
                      color: AppColors.greenAccentShade700,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(40)),
          
              Obx(
                ()=> InkWell(
                  onTap: () {
                    controller.isOn.value = !controller.isOn.value;
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: AppSize.getSize(40)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cached_sharp,
                          size: AppSize.getSize(30),
                          color: AppColors.greyShade400,
                        ),
                        SizedBox(width: AppSize.getSize(15)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Allow Sharing",
                                style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                              ),
                              Text(
                                "Let pepople who can see your status reshare and forward it.",
                                style: TextStyle(
                                  color: AppColors.greyShade400,
                                  fontSize: AppSize.getSize(16),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                          
                        Switch(
                          value: controller.isOn.value,
                          activeThumbColor: AppColors.blackColor,
                          activeTrackColor: AppColors.greenAccentShade700,
                          inactiveTrackColor: AppColors.blackColor,
                          onChanged: (val) {
                            controller.isOn.value = val;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
          
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Share across apps",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
          
                  Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Automatically share your status to your Facebook or instagram Stories.",
                                style: TextStyle(
                                  color: AppColors.greyShade400,
                                  fontSize: AppSize.getSize(16),
                                ),
                              ),
                              TextSpan(
                                text: " Manage in Accounts Center",
                                style: TextStyle(
                                  color: AppColors.greenAccentShade700,
                                  fontSize: AppSize.getSize(16),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          
              SizedBox(height: AppSize.getSize(20)),
              Obx(
              ()=> InkWell(
                  onTap: () {
                    controller.isYes.value = !controller.isYes.value;
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: AppSize.getSize(40)),
                    child: Row(
                      children: [
                        Icon(Icons.facebook, size: AppSize.getSize(30), color: AppColors.greyShade400),
                        SizedBox(width: AppSize.getSize(15)),
                        Expanded(
                          child: Text(
                            "Facebook Story",
                            style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                          ),
                        ),
                        Switch(
                          value: controller.isYes.value,
                          activeThumbColor: AppColors.blackColor,
                          activeTrackColor: AppColors.greenAccentShade700,
                          inactiveTrackColor: AppColors.blackColor,
                          onChanged: (val) {
                            controller.isYes.value = val;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              Obx(
               ()=> InkWell(
                  onTap: () {
                    controller.isNo.value = !controller.isNo.value;
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: AppSize.getSize(40)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.flip_to_front_rounded,
                          size: AppSize.getSize(30),
                          color: AppColors.greyShade400,
                        ),
                        SizedBox(width: AppSize.getSize(15)),
                        Expanded(
                          child: Text(
                            "Instagram Story",
                            style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                          ),
                        ),
                        Switch(
                          value: controller.isNo.value,
                          activeThumbColor: AppColors.blackColor,
                          activeTrackColor: AppColors.greenAccentShade700,
                          inactiveTrackColor: AppColors.blackColor,
                          onChanged: (val) {
                            controller.isNo.value = val;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          
              SizedBox(height: AppSize.getSize(20)),
              Text(
                "Changes to your privacy settings won't affect status updates that you've sent already",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
            ],
          ),
        ),
      
    );
  }

  Widget radioTile(String title) {
    return Obx((){
      bool isSelected = controller.selectedOption.value == title;
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
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.greenAccentShade700 : AppColors.greyColor,
                  width: AppSize.getSize(2),
                ),
              ),
              child: isSelected
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
