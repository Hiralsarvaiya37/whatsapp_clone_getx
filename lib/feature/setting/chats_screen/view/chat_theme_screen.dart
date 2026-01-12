import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ChatThemeScreen extends StatelessWidget {
  const ChatThemeScreen({super.key});

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
          "Chat theme",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(Icons.more_vert, size:  AppSize.getSize(25), color: AppColors.whiteColor),
          SizedBox(width:  AppSize.getSize(15)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:  AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Themes",
              style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
            ),
            SizedBox(height: AppSize.getSize(20)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      themeBox(AppColors.redColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppColors.greenColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppColors.yellowColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppColors.deeppurpleColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppColors.orangeColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppColors.pinkColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppColors.blueColor),
                      SizedBox(width: AppSize.getSize(15)),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(15)),
                  Row(
                    children: [
                      themeBox(AppColors.pinkColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppColors.orangeColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppColors.deeppurpleColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppColors.yellowColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppColors.greenColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppColors.redColor),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.getSize(30)),
            Text(
              "The chat color and wallpaper will both change.",
              style: TextStyle(color: AppColors.greyShade400, fontSize: 16),
            ),
            SizedBox(height: AppSize.getSize(20)),
            Text(
              "Customize",
              style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
            ),
            SizedBox(height: AppSize.getSize(20)),
            Padding(
              padding: EdgeInsets.only(left: AppSize.getSize(20)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.chat, size: AppSize.getSize(30), color: AppColors.greyShade400),
                      SizedBox(width: AppSize.getSize(20)),
                      Text(
                        "Chat color",
                        style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  Row(
                    children: [
                      Icon(
                        Icons.wallpaper,
                        size: AppSize.getSize(30),
                        color: AppColors.greyShade400,
                      ),
                      SizedBox(width: AppSize.getSize(20)),
                      Text(
                        "Wallpaper",
                        style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget themeBox(Color color) {
    return Container(
      height: AppSize.getSize(110),
      width: AppSize.getSize(80),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
