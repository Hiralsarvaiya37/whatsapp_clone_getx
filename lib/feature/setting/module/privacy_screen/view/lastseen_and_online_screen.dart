import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class LastseenAndOnlineScreen extends GetView<PrivacyViewController> {
  static const id = "/LastseenAndOnlineScreen";
 const LastseenAndOnlineScreen({super.key});

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          "Last seen and online",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Who can see my last seen",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(15)),

              Obx(
               ()=> radioTile("Everyone", controller.selectedlastSeen.value, (
                  value,
                ) {
                  controller.selectedlastSeen.value = value;
                }),
              ),

              Obx(
             ()=> radioTile(
                  "My contacts",
                  controller.selectedlastSeen.value,
                  (value) {
                    controller.selectedlastSeen.value = value;
                  },
                ),
              ),

              Obx(
              ()=> radioTile(
                  "My contacts except...",
                  controller.selectedlastSeen.value,
                  (value) {
                    controller.selectedlastSeen.value = value;
                  },
                ),
              ),

              Obx(
               ()=> radioTile("Nobody", controller.selectedlastSeen.value, (
                  value,
                ) {
                  controller.selectedlastSeen.value = value;
                }),
              ),

              SizedBox(height: AppSize.getSize(40)),
              Text(
                "Who can see when I'm online",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(15)),

              Obx(
                ()=>radioTile("Everyone", controller.selectedonline.value, (
                  value,
                ) {
                  controller.selectedonline.value = value;
                }),
              ),

              Obx(
                ()=> radioTile(
                  "Same as last seen",
                  controller.selectedonline.value,
                  (value) {
                    controller.selectedonline.value = value;
                  },
                ),
              ),

              SizedBox(height: AppSize.getSize(20)),
              Text(
                "If you don't share when you were last seen or online, you won't be able to see when other people were last seen or online.",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
            ],
          ),
        ),
      
    );
  }

  Widget radioTile(
    String title,
    String selectedValue,
    Function(String) onSelect,
  ) {
    bool isSelected = selectedValue == title;

    return InkWell(
      onTap: () => onSelect(title),
      child: Padding(
        padding: EdgeInsets.only(
          top: AppSize.getSize(10),
          bottom: AppSize.getSize(10),
          left: AppSize.getSize(20),
        ),
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.greenAccentShade700
                      : AppColors.greyColor,
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
            Text(
              title,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppSize.getSize(18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
