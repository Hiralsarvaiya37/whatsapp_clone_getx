import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/provider/privacy_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ProfilePhotoScreen extends StatelessWidget {
  static const id = "/ProfilePhotoScreen";
  const ProfilePhotoScreen({super.key});

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
          "Profile photo",
          style: TextStyle(
            color: AppTheme.whiteColor,
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
                "Who can see my profile photo",
                style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("Everyone",context),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("My contacts", context),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("My contacts except...", context),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("Nobody", context),
            ],
          ),
        ),
      
    );
  }

  Widget radioTile(String title, BuildContext context) {
    final provider = context.read<PrivacyViewProvider>();
   return Obx((){
     bool isSelected = provider.selectedOption == title;
    return InkWell(
      onTap: () {
        
          provider.selectedOption = title;
       
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
                  color: isSelected ? AppTheme.greenAccentShade700 : AppTheme.greyColor,
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
                          color: AppTheme.greenAccentShade700,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),

            SizedBox(width: AppSize.getSize(15)),

            Text(title, style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18))),
          ],
        ),
      ),
    );
   });
  }
}
