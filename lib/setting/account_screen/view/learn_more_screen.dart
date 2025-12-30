// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/controller/account_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class LearnMoreScreen extends StatelessWidget {
  LearnMoreScreen({super.key});

  final AccountViewController learnController = Get.find();

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
          "Help article",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          PopupMenuButton(
            color: AppColors.greyShade900,
            offset: Offset(AppSize.getSize(0), AppSize.getSize(45)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            icon: Icon(Icons.more_vert, color: AppColors.whiteColor, size: AppSize.getSize(25)),

            itemBuilder: (context) => [
              popupTile("Open in browser"),
              popupTile("Send"),
              popupTile("Copy link"),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About security code change notifications",
                style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(25)),
              ),

              SizedBox(height: AppSize.getSize(20)),
              Obx(() {
                if (!learnController.isInitialized.value) {
                  return Container(
                    height: AppSize.getSize(200),
                    color: AppColors.greyShade900,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio:
                          learnController.videoController.value.aspectRatio,
                      child: VideoPlayer(learnController.videoController),
                    ),
                    IconButton(
                      icon: Icon(
                        learnController.isPlaying.value
                            ? Icons.pause_circle
                            : Icons.play_circle,
                        size: AppSize.getSize(50),
                        color: AppColors.whiteColor,
                      ),
                      onPressed: () {
                        learnController.playPause();
                      },
                    ),
                  ],
                );
              }),

              SizedBox(height: AppSize.getSize(20)),
              Text(
                "End-to-end encrypted chats between you and one other person have their own security code. this code is used to verify that the calls and the messages you send to that chat are end-to-end encrypted.",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
              ),
              SizedBox(height: AppSize.getSize(8)),
              Text(
                "The security code can be found in the contact info screen, both as a QR code and a 60-digit number. these codes are unique to each individual chat. they can be compared between people in each chat to verify that the messages you send to the chat are end-to-end encypted.security codes are just visible versions of the special keys shared between you. Don't worry,it's not the actual keys themselves, which are always kept secret.",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
              ),
              SizedBox(height: AppSize.getSize(10)),
              Text(
                "At times, the security codes used in end-to-end encrypted chats between you and one other person might change. This is likely because you or your contact reinstalled WhatsApp, changed phones, or added or removed a paired device. You can always verify that a contact's security code is legitimte.",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
              ),
              SizedBox(height: AppSize.getSize(5)),
              Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Learn how in ",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),

                          TextSpan(
                            text: "this article ",
                            style: TextStyle(
                              color: AppColors.blueshade500,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                          TextSpan(
                            text: "on end-to-end encryption.",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(25)),

              Text(
                "Receive notification when security codes change",
                style: TextStyle(
                  color: AppColors.greenAccentShade700,
                  fontSize: AppSize.getSize(20),
                ),
              ),
              SizedBox(height: AppSize.getSize(7)),
              Text(
                "You can receive notifications when your security code changes for a contact's phone in an end-to-end encrypted chat. to do so, you'll need to enable the setting on each device where you want to get notifications.",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
              ),
              SizedBox(height: AppSize.getSize(25)),
              Text(
                "Enable security code notifications",
                style: TextStyle(
                  color: AppColors.greenAccentShade700,
                  fontSize: AppSize.getSize(20),
                ),
              ),
              SizedBox(height: AppSize.getSize(7)),
              Row(
                children: [
                  Text(
                    "1. Tap ",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    size: AppSize.getSize(25),
                    color: AppColors.greenAccentShade700,
                  ),
                  Text(
                    "> Settings.",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(7)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2. ",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
                  ),
                  Expanded(
                    child: Text(
                      "Tap Account > Security notifications.",
                      style: TextStyle(
                        color: AppColors.greyShade400,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(7)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3. ",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
                  ),

                  Expanded(
                    child: Text(
                      "Turn on Show security notifications on this device.",
                      style: TextStyle(
                        color: AppColors.greyShade400,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(20)),
              Text(
                "Disable security code notifications",
                style: TextStyle(
                  color: AppColors.greenAccentShade700,
                  fontSize: AppSize.getSize(20),
                ),
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  Text(
                    "1. Tap ",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    size: AppSize.getSize(25),
                    color: AppColors.greenAccentShade700,
                  ),
                  Text(
                    "> Settings.",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(7)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2. ",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
                  ),
                  Expanded(
                    child: Text(
                      "Tap Account > Security notifications.",
                      style: TextStyle(
                        color: AppColors.greyShade400,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(7)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3. ",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
                  ),

                  Expanded(
                    child: Text(
                      "Turn off Show security notifications on this device.",
                      style: TextStyle(
                        color: AppColors.greyShade400,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(40)),
              Obx(
                () => learnController.isYes.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Thanks for letting us know!",
                            style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                          ),
                          SizedBox(height: AppSize.getSize(5)),
                          Padding(
                            padding: EdgeInsets.only(left: AppSize.getSize(10)),
                            child: Text(
                              "We'll use your feedback to help improve WhatsApp support",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(20)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.check_circle_outline,
                              size: AppSize.getSize(50),
                              color: AppColors.greenAccentShade700,
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(7)),
                        ],
                      )
                    : learnController.isNo.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Tell us a little more",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppSize.getSize(18),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(20)),
                          Obx(
                            () => Column(
                              children: List.generate(
                                learnController.options.length,
                                (index) {
                                  return Row(
                                    children: [
                                      Radio<int>(
                                        value: index,
                                        groupValue: learnController
                                            .selectedOption
                                            .value,
                                        onChanged: (value) {
                                          learnController.selectedOption.value =
                                              value!;
                                        },
                                        activeColor:
                                            AppColors.greenAccentShade700,
                                      ),
                                      SizedBox(width: AppSize.getSize(5)),
                                      Expanded(
                                        child: Text(
                                          learnController.options[index],
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: AppSize.getSize(16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(30)),
                          Obx(
                            () => GestureDetector(
                              onTap: learnController.selectedOption.value == -1
                                  ? null
                                  : () {
                                      learnController.isYes.value = true;
                                      learnController.isNo.value = false;
                                    },
                              child: Container(
                                height: AppSize.getSize(45),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color:
                                      learnController.selectedOption.value == -1
                                      ? AppColors.greyShade800
                                      : AppColors.greenAccentShade700,
                                  borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Submit feedback",
                                  style: TextStyle(
                                    color:
                                        learnController.selectedOption.value ==
                                            -1
                                        ? AppColors.greyShade400
                                        : AppColors.blackColor,
                                    fontSize: AppSize.getSize(16),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            "Does this answer your question?",
                            style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                          ),
                          SizedBox(height: AppSize.getSize(5)),
                          Text(
                            "Your response is anonymous helps us improve our help resources",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(15),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(50)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      learnController.isYes.value = true;
                                    },
                                    child: Container(
                                      height: AppSize.getSize(50),
                                      width: AppSize.getSize(50),
                                      decoration: BoxDecoration(
                                        color: AppColors.greenshade900,
                                        borderRadius: BorderRadius.circular(AppSize.getSize(50)),
                                      ),
                                      child: Icon(
                                        Icons.thumb_up_alt,
                                        color: AppColors.greenAccentShade700,
                                        size: AppSize.getSize(25),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: AppSize.getSize(7)),
                                  Text(
                                    "Yes",
                                    style: TextStyle(
                                      color: AppColors.greenAccentShade700,
                                      fontSize: AppSize.getSize(18),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: AppSize.getSize(50)),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      learnController.isNo.value = true;
                                    },
                                    child: Container(
                                      height: AppSize.getSize(50),
                                      width: AppSize.getSize(50),
                                      decoration: BoxDecoration(
                                        color: AppColors.greenshade900,
                                        borderRadius: BorderRadius.circular(AppSize.getSize(50)),
                                      ),
                                      child: Icon(
                                        Icons.thumb_down,
                                        color: AppColors.greenAccentShade700,
                                        size: AppSize.getSize(25),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: AppSize.getSize(7)),
                                  Text(
                                    "No",
                                    style: TextStyle(
                                      color: AppColors.greenAccentShade700,
                                      fontSize: AppSize.getSize(18),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuItem popupTile(String title) {
    return PopupMenuItem(
      child: Text(title, style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(17))),
    );
  }
}