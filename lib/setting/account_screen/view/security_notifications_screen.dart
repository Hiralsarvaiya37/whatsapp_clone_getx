import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/controller/account_view_controller.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class SecurityNotificationsScreen extends StatelessWidget {
  SecurityNotificationsScreen({super.key});
  final AccountViewController securityController = Get.find();

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          "Security notifications",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.getSize(20),
            vertical: AppSize.getSize(20),
          ),
          child: Column(
            children: [
              SizedBox(height: AppSize.getSize(10)),
              Center(
                child: Icon(
                  Icons.lock,
                  color: AppColors.greenAccentShade700,
                  size: AppSize.getSize(80),
                ),
              ),

              SizedBox(height: AppSize.getSize(35)),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your chats and calls are private",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(20)),
                        Text(
                          "End-to-end encryption keeps your personal messaged and calls between you and the people you choose. no one outside of the chat, not even WhatsApp, can read, listen to, or share them. this includes your.",
                          softWrap: true,
                          style: TextStyle(
                            color: AppColors.greyShade400,
                            fontSize: AppSize.getSize(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(30)),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.message,
                        color: AppColors.greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        "Text and voice messages",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(7)),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: AppColors.greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        "Audio and video calls",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(7)),
                  Row(
                    children: [
                      Icon(
                        Icons.crop_portrait,
                        color: AppColors.greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        "Photos, videos and documents",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(7)),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        "Location sharing",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(7)),
                  Row(
                    children: [
                      Icon(
                        Icons.update_sharp,
                        color: AppColors.greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        "Status updates",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(15)),
                  Row(
                    children: [
                      Text(
                        "Learn more",
                        style: TextStyle(
                          color: AppColors.blueshade500,
                          fontSize: AppSize.getSize(18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(35)),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          securityController.isNotificationOn.value =
                              !securityController.isNotificationOn.value;
                        },
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Show security notifications on this device",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: AppSize.getSize(18),
                                  ),
                                ),
                              ),
                              Switch(
                                value:
                                    securityController.isNotificationOn.value,
                                activeThumbColor: AppColors.blackColor,
                                activeTrackColor: AppColors.greenAccentShade700,
                                inactiveTrackColor: AppColors.blackColor,
                                onChanged: (val) {
                                  securityController.isNotificationOn.value =
                                      val;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: AppSize.getSize(10)),

                      Padding(
                        padding: EdgeInsets.only(right: AppSize.getSize(60)),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Get notified when your security code changes for a contact's phone "
                                    "in an end-to-end encrypted chat. If you have multiple devices, this "
                                    "setting must be enabled on each device where you want to get notifications. ",
                                style: TextStyle(
                                  color: AppColors.greyShade400,
                                  fontSize: AppSize.getSize(16),
                                ),
                              ),
                              TextSpan(
                                text: "Learn more",
                                style: TextStyle(
                                  color: AppColors.blueshade500,
                                  fontSize: AppSize.getSize(16),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LearnMoreScreen(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final SecurityNotificationsScreen securityController = Get.put(
  SecurityNotificationsScreen(),
);
