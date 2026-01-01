import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/setting/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class AppLockScreen extends StatelessWidget {
   AppLockScreen({super.key});

  final PrivacyViewController appController = Get.find();

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
          "App lock",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child:  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Unlock with biometric",
                      style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                    ),
                    Text(
                      "When enabled, you'll need to use fingerprint, face or other unique identifiers to open WhatsApp. You can still answer calls if WhatsApp is locked.",
                      style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                    ),
                  ],
                ),
              ),
          
              Obx(
                ()=> Switch(value: appController.isOn.value,
                activeThumbColor: AppColors.blackColor,
                activeTrackColor: AppColors.greenAccentShade700,
                inactiveTrackColor: AppColors.blackColor,
                 onChanged: (val){
                    appController.isOn.value = val;
                }),
              )
            ],
          ),
        ),
      
    );
  }
}
