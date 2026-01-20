import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AdvancedScreen extends GetView<PrivacyViewController> {
  static const id = "/AdvancedScreen";
  const AdvancedScreen({super.key});


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
          "Advanced",
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
            children: [
              appTitle(
                "Block unknown account messages",
                "To protect your account and improve device performance, WhatsApp will block messages from unknown accounts if they exced a certain volume. ",
                1,
                context
              ),
              SizedBox(height: AppSize.getSize(30)),
              appTitle(
                "Protect IP address in calls",
                "To make it harder for people to infer your location, calls on this device will be securely relayed through WhatsApp servers. This will reduce call quality. ",
                2,
                context
              ),
              SizedBox(height: AppSize.getSize(30)),
              appTitle(
                "Disable link previews",
                "To help protect your IP address from being inferred by third-party websites, previews for the links you share in chats will no longer be generated. ",
                3,
                context
              ),
            ],
          ),
        ),
      
    );
  }

  Widget appTitle(String title, String subtitle, int index, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: AppTheme.whiteColor, fontSize: 20)),
              SizedBox(height: AppSize.getSize(5)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: subtitle,
                      style: TextStyle(
                        color: AppTheme.greyShade400,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                    TextSpan(
                      text: "Learn more",
                      style: TextStyle(
                        color: AppTheme.blueshade500,
                        fontSize: AppSize.getSize(16),
                        fontWeight: FontWeight.bold,
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
            value: index == 1
                ? controller.isOn1.value
                : index == 2
                ? controller.isOn2.value
                : controller.isOn3.value,
            activeThumbColor: AppTheme.blackColor,
            activeTrackColor: AppTheme.greenAccentShade700,
            inactiveTrackColor: AppTheme.blackColor,
            onChanged: (val) {
                if (index == 1) controller.isOn1.value = val;
                if (index == 2) controller.isOn2.value = val;
                if (index == 3) controller.isOn3.value = val;
            },
          ),
        ),
      ],
    );
  }
}
