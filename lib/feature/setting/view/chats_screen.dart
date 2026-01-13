import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_backup_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_history_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_theme_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/transfer_chat_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ChatsScreen extends GetView<SettingController> {
  static const id = "/ChatsScreen";
  const ChatsScreen({super.key});


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
          "Chats",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Display",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, dialogSetState) {
                          return Dialog(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.greyShade900,
                                borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSize.getSize(25),
                                  vertical: AppSize.getSize(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Choose theme",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 22,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(20)),

                                    radioTile(
                                      "System default",
                                      dialogSetState,
                                      controller.selectedTheme.value,
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    radioTile(
                                      "Light",
                                      dialogSetState,
                                      controller.selectedTheme.value,
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    radioTile(
                                      "Dark",
                                      dialogSetState,
                                      controller.selectedTheme.value,
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
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: AppSize.getSize(30)),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Ok",
                                            style: TextStyle(
                                              color:
                                                  AppColors.greenAccentShade700,
                                              fontSize: AppSize.getSize(16),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
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
                child: Row(
                  children: [
                    Icon(Icons.settings, size: AppSize.getSize(30), color: AppColors.greyShade400),
                    SizedBox(width: AppSize.getSize(30)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Theme",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Obx(
                        ()=> Text(
                            controller.selectedTheme.value,
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                Get.toNamed(ChatThemeScreen.id);
                },
                child: Row(
                  children: [
                    Icon(Icons.chat, size: AppSize.getSize(30), color: AppColors.greyShade400),
                    SizedBox(width: AppSize.getSize(30)),
                    Text(
                      "Default chat theme",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppSize.getSize(18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.getSize(40)),
              Text(
                "Chat settings",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Obx(
               ()=> appInfo(
                  "Enter is send",
                  "Enter key will send your message",
                  switchValue: controller.ison1.value,
                  onChanged: (val) {
                      controller.ison1.value = val;
                  },
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              Obx(
                ()=> appInfo(
                  "Media visibility",
                  "Show newly downloaded media in your device's gallery",
                  switchValue: controller.ison2.value,
                  onChanged: (val) {
                      controller.ison2.value = val;
                  },
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              appInfo(
                "Font size",
                controller.selectedFontSize.value,
                showSwitch: false,
              ),
              SizedBox(height: AppSize.getSize(30)),
              appInfo(
                "Voice message transcripts",
                "Read new voice messages.",
                showSwitch: false,
              ),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "Archived chats",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Obx(
                ()=> appInfo(
                  "Keep chats archived",
                  "Archived chats will remain archived when you receive a new message",
                  switchValue: controller.ison3.value,
                  onChanged: (val) {
                      controller.ison3.value = val;
                  },
                ),
              ),

              SizedBox(height: AppSize.getSize(40)),
              InkWell(
                onTap: () {
                 Get.toNamed(ChatBackupScreen.id);
                },
                child: chatInfo("Chat backup", Icons.backup_outlined),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                   Get.toNamed(TransferChatScreen.id);
                },
                child: chatInfo("Transfer chats", Icons.send_to_mobile_rounded),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                    Get.toNamed(ChatHistoryScreen.id);
                },
                child: chatInfo("Chat history", Icons.replay_outlined),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget chatInfo(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: AppSize.getSize(30), color: AppColors.greyShade400),
        SizedBox(width: AppSize.getSize(30)),
        Text(
          title,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget appInfo(
    String title,
    String subtitle, {
    bool showSwitch = true,
    bool? switchValue,
    Function(bool)? onChanged,
  }) {
    return InkWell(
      onTap: () {
      if (showSwitch && onChanged != null) {
        onChanged(!(switchValue ?? false)); 
      }
    },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: AppSize.getSize(55)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: AppSize.getSize(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                ],
              ),
            ),
          ),
          if (showSwitch)
            Switch(
              value: switchValue ?? false,
              activeThumbColor: AppColors.blackColor,
              activeTrackColor: AppColors.greenAccentShade700,
              inactiveTrackColor: AppColors.blackColor,
              onChanged: onChanged,
            ),
        ],
      ),
    );
  }

  Widget radioTile(
    String title,
    StateSetter dialogSetState,
    String currentSelected,
  ) {
   
     bool isSelected = currentSelected == title;
    return InkWell(
      onTap: () {
        dialogSetState(() {
          if (title == "Small" || title == "Medium" || title == "Large") {
            controller.selectedFontSize.value = title;
          } else {
            controller.selectedTheme.value = title;
          }
        });
          if (title == "Small" || title == "Medium" || title == "Large") {
            controller.selectedFontSize.value = title;
          } else {
            controller.selectedTheme.value = title;
          }
      },
      child: Container(
        color: AppColors.greyShade900,
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.greenAccentShade700 : AppColors.greyColor,
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
            Text(title, style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18))),
          ],
        ),
      ),
    );
  
  }
}
