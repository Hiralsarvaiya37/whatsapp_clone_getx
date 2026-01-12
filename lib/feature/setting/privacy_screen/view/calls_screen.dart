import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class CallsScreen extends StatelessWidget {
   CallsScreen({super.key});

 final PrivacyViewController callsController = Get.find();

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
          "Calls",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Slience unknown callers",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                  ),
                  SizedBox(height: AppSize.getSize(10)),
                  Text(
                    "Calls from unknown numbers will be silenced. They will still be shown in the calls tab and in your notifications. ",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnMoreScreen()));
                    },
                    child: Text(
                      "Learn more",
                      style: TextStyle(
                        color: AppColors.blueshade500,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
             ()=> Column(
                children: [
                  Switch(
                    value: callsController.isOn.value,
                    activeThumbColor: AppColors.blackColor,
                    activeTrackColor: AppColors.greenAccentShade700,
                    inactiveTrackColor: AppColors.blackColor,
                    onChanged: (val) {
                        callsController.isOn.value = val;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
