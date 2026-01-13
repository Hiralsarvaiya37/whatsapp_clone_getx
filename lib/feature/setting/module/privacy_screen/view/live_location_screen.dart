import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class LiveLocationScreen extends StatelessWidget {
  static const id = "/LiveLocationScreen";
  const LiveLocationScreen({super.key});

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
          "Live location",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.getSize(10)),
            Icon(
              Icons.location_on_sharp,
              color: AppColors.greenAccentShade700,
              size: AppSize.getSize(80),
            ),
            SizedBox(height: AppSize.getSize(40)),
            Text(
              "You aren't sharing live location in any chats",
              style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
            ),
            SizedBox(height: AppSize.getSize(25)),
            Text(
              "Live location requires background location. you can manage this in your devices settings.",
              style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
            ),
          ],
        ),
      ),
    );
  }
}
