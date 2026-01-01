import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

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
          "Avatar",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(25), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.getSize(20)),
            Icon(Icons.groups, size: AppSize.getSize(80), color: AppColors.greenAccentShade700),
            SizedBox(height: AppSize.getSize(30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Say more with Avatars now on WhatsApp",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(17)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: AppSize.getSize(15)),
            Container(
              height: AppSize.getSize(43),
              decoration: BoxDecoration(
                color: AppColors.greenAccentShade700,
                borderRadius: BorderRadius.circular(AppSize.getSize(30)),
              ),
              alignment: Alignment.center,
              child: Text(
                "Create your Avatar",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: AppSize.getSize(16)),
              ),
            ),

            SizedBox(height: AppSize.getSize(45)),
            Row(
              children: [
                Text(
                  "Learn more",
                  style: TextStyle(
                    color: AppColors.blueshade500,
                    fontSize: AppSize.getSize(18),
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.blueshade500
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
