import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/default_message_timer_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class DisappearingMessagesScreen extends StatelessWidget {
  static const id = "/DisappearingMessagesScreen";
  const DisappearingMessagesScreen({super.key});

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
          "Disappearing messages",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(30),
          vertical: AppSize.getSize(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time,
                  size: AppSize.getSize(70),
                  color: AppColors.greenAccentShade700,
                ),
                SizedBox(height: AppSize.getSize(30)),
                Text(
                  "Set messages to automatically disappear",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppSize.getSize(18),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSize.getSize(15)),
                Text(
                  "For added privacy, new messages will disappear for everyone from the chat after the duration you select. Chat members will see you turned this on.",
                  style: TextStyle(
                    color: AppColors.greyShade400,
                    fontSize: AppSize.getSize(15),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Learn more",
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: AppSize.getSize(15),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.getSize(35)),
            Text(
              "Set for your account",
              style: TextStyle(
                color: AppColors.greyShade400,
                fontSize: AppSize.getSize(16),
              ),
            ),
            SizedBox(height: AppSize.getSize(20)),
            InkWell(
              onTap: () {
                Get.toNamed(DefaultMessageTimerScreen.id);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_outline_outlined,
                    size: AppSize.getSize(30),
                    color: AppColors.greyShade400,
                  ),
                  SizedBox(width: AppSize.getSize(30)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Default message timer",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "New chats will begin with a disappearing message timer",
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
            ),
            SizedBox(height: AppSize.getSize(30)),
            Text(
              "Set for your current chats",
              style: TextStyle(
                color: AppColors.greyShade400,
                fontSize: AppSize.getSize(16),
              ),
            ),
            SizedBox(height: AppSize.getSize(20)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.list_alt,
                  size: AppSize.getSize(30),
                  color: AppColors.greyShade400,
                ),
                SizedBox(width: AppSize.getSize(30)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Apply timer to chats",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppSize.getSize(18),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "5 chats using disappearing messages",
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
          ],
        ),
      ),
    );
  }
}
