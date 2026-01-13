import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/controller/chat_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/end_to_end_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ChatBackupScreen extends GetView<ChatViewController> {
  static const id = "/ChatBackupScreen";
  const ChatBackupScreen({super.key});

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
          "Chat backup",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Backup settings",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              Text(
                "Back up your chats and media to your Google Account's storage. You can restore them on a new phone after you download WhatsApp on it.",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Text(
                "Local: 2:09 AM",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppSize.getSize(18),
                ),
              ),
              SizedBox(height: AppSize.getSize(5)),
              Text(
                "Last Backup: Never",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppSize.getSize(18),
                ),
              ),
              SizedBox(height: AppSize.getSize(25)),
              Container(
                height: AppSize.getSize(42),
                width: AppSize.getSize(110),
                decoration: BoxDecoration(
                  color: AppColors.greenAccentShade700,
                  borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Back up",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "Manage Goggle storage",
                style: TextStyle(
                  color: AppColors.greenAccentShade700,
                  fontSize: AppSize.getSize(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSize.getSize(35)),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (contex, dialogSetState) {
                          return Dialog(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.greyShade900,
                                borderRadius: BorderRadius.circular(
                                  AppSize.getSize(20),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSize.getSize(25),
                                  vertical: AppSize.getSize(20),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Choose an account",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: AppSize.getSize(22),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(40)),
                                    Obx(
                                      () => radioTile(
                                        "abcced123@gmail.com",
                                        dialogSetState,
                                        controller.selectedGoogleAccount.value,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    Obx(
                                      () => radioTile(
                                        "Add account",
                                        dialogSetState,
                                        controller.selectedGoogleAccount.value,
                                      ),
                                    ),

                                    SizedBox(height: AppSize.getSize(35)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                              color:
                                                  AppColors.greenAccentShade700,
                                              fontSize: AppSize.getSize(16),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: AppSize.getSize(15)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Goggle Account",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppSize.getSize(18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.selectedGoogleAccount.value,
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (contex, dialogSetState) {
                          return Dialog(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.greyShade900,
                                borderRadius: BorderRadius.circular(
                                  AppSize.getSize(20),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSize.getSize(25),
                                  vertical: AppSize.getSize(20),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Automatic backups",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: AppSize.getSize(22),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(40)),
                                    Obx(
                                      () => radioTile(
                                        "Daily",
                                        dialogSetState,
                                        controller.backupFrequency.value,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    Obx(
                                      () => radioTile(
                                        "Weekly",
                                        dialogSetState,
                                        controller.backupFrequency.value,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    Obx(
                                      () => radioTile(
                                        "Monthly",
                                        dialogSetState,
                                        controller.backupFrequency.value,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    Obx(
                                      () => radioTile(
                                        "Only when I tap 'Back up",
                                        dialogSetState,
                                        controller.backupFrequency.value,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    Obx(
                                      () => radioTile(
                                        "Off",
                                        dialogSetState,
                                        controller.backupFrequency.value,
                                      ),
                                    ),

                                    SizedBox(height: AppSize.getSize(35)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                              color:
                                                  AppColors.greenAccentShade700,
                                              fontSize: AppSize.getSize(16),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: AppSize.getSize(15)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Automatic backups",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.backupFrequency.value,
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.getSize(35)),
              appTile("Include videos", 1),
              SizedBox(height: AppSize.getSize(30)),
              appTile("Back up using cellular", 2),

              SizedBox(height: AppSize.getSize(40)),
              Text(
                "End-to-end encryption",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              Text(
                "For added security, you can protect your backup with end-to-end encryption.",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              InkWell(
                onTap: () {
                Get.toNamed(EndToEndScreen.id);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.getSize(15)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: AppSize.getSize(30),
                        color: AppColors.greyShade400,
                      ),
                      SizedBox(width: AppSize.getSize(20)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End-to-end encrypted backup",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: AppSize.getSize(18),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Off",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSize.getSize(15)),
            ],
          ),
        ),
      ),
    );
  }

  Widget appTile(String title, int index) {
    return Obx(() {
      bool switchValue = index == 1
          ? controller.isOn1.value
          : controller.isOn2.value;
      return InkWell(
        onTap: () {
          if (index == 1) {
            controller.isOn1.value = !controller.isOn1.value;
          } else if (index == 2) {
            controller.isOn2.value = !controller.isOn2.value;
          }
        },
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppSize.getSize(18),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Switch(
              value: switchValue,
              activeThumbColor: AppColors.blackColor,
              activeTrackColor: AppColors.greenAccentShade700,
              inactiveTrackColor: AppColors.blackColor,
              onChanged: (val) {
                if (index == 1) {
                  controller.isOn1.value = val;
                } else if (index == 2) {
                  controller.isOn2.value = val;
                }
              },
            ),
          ],
        ),
      );
    });
  }

  Widget radioTile(
    String title,
    StateSetter dialogSetState,
    String groupValue,
  ) {
    bool isSelected = groupValue == title;
    return InkWell(
      onTap: () {
        dialogSetState(() {
          if (title == "abcced123@gmail.com" || title == "Add account") {
            controller.selectedGoogleAccount.value = title;
          } else {
            controller.backupFrequency.value = title;
          }
        });
      },
      child: Row(
        children: [
          Container(
            height: AppSize.getSize(22),
            width: AppSize.getSize(22),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? AppColors.greenAccentShade700
                    : AppColors.greyColor,
                width: AppSize.getSize(2),
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      height: AppSize.getSize(12),
                      width: AppSize.getSize(12),
                      decoration: BoxDecoration(
                        color: AppColors.greenAccentShade700,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : SizedBox(),
          ),
          SizedBox(width: AppSize.getSize(20)),
          Text(
            title,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: AppSize.getSize(16),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
