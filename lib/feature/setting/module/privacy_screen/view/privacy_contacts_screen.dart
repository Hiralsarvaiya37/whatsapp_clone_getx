import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class PrivacyContactsScreen extends GetView<PrivacyViewController> {
  static const id = "/PrivacyContactsScreen";
  const PrivacyContactsScreen({super.key});

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
          "Contacts",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Blocked contacts",
                style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(19)),
              ),
              Text(
                "0",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(19)),
              ),
              SizedBox(height: AppSize.getSize(30)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WhatsApp contacts",
                          style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(19)),
                        ),
                        SizedBox(height: AppSize.getSize(19)),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Contacts are saved to your WhatsApp account to manage them across devices. ",
                                style: TextStyle(
                                  color: AppColors.greyShade400,
                                  fontSize: AppSize.getSize(17),
                                ),
                              ),
                              TextSpan(
                                text: "Learn more",
                                style: TextStyle(
                                  color: AppColors.blueshade500,
                                  fontSize: AppSize.getSize(17),
                                  fontWeight: FontWeight.w600,
                                ),recognizer: TapGestureRecognizer()
                                ..onTap = (){
                                  Get.toNamed(LearnMoreScreen.id);
                                }
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    ()=> Switch(
                      value: controller.isOn.value,
                      activeThumbColor: AppColors.blackColor,
                      activeTrackColor: AppColors.greenAccentShade700,
                      inactiveTrackColor: AppColors.blackColor,
                      onChanged: (val) {
                          controller.isOn.value = val;
                      },
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
