import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ChannelReportsScreen extends StatelessWidget {
  const ChannelReportsScreen({super.key});

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
          "Channel reports",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No reports",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppSize.getSize(22),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSize.getSize(5)),
            Text(
              "If you report a channel, you can see your report and the outcome here.",
              style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
