import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class LinksScreen extends StatelessWidget {
   LinksScreen({super.key});

  final PrivacyViewController linksController = Get.find();

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
          "Links",
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
                "Who can see links on my profile",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("Everyone"),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("My contacts"),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("my contacts except..."),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("Nobody"),
            ],
          ),
        ),
      
    );
  }

  Widget radioTile(String title) {
    return Obx((){
      bool isSelected = linksController.selectedOption.value == title;
    return InkWell(
      onTap: () {
       
          linksController.selectedOption.value = title;
      
      },
      child: Padding(
        padding:  EdgeInsets.only(left: AppSize.getSize(20)),
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? AppColors.greenAccentShade700 : AppColors.greyColor,
                  width: AppSize.getSize(2),
                ),
                shape: BoxShape.circle,
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
        
            Text(title, style: TextStyle(fontSize: AppSize.getSize(18), color: AppColors.whiteColor)),
          ],
        ),
      ),
    );
    });
  }
}
