import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/provider/privacy_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AvatarStickersScreen extends StatelessWidget {
  static const id = "/AvatarStickersScreen";
  const AvatarStickersScreen({super.key});


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
          "Avatar stickers",
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
                "Who can feature my avatar in their stickers",
                style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("My contacts", context),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("Selected contacts...", context),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("Nobody", context),
              SizedBox(height: AppSize.getSize(20)),
              Text(
                "If you and a contact allow this for each other, stickers featuring your avatar with their avatar will be available in your chat.",
                style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
              ),
            ],
          ),
        ),
      
    );
  }

  Widget radioTile(String title, BuildContext context) {
     final provider = context.read<PrivacyViewProvider>();
  
     bool isselected = provider.selectedOption == title;
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
                shape: BoxShape.circle,
                border: Border.all(
                  color: isselected ? AppTheme.greenAccentShade700 : AppTheme.greyColor,
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

  }
}
