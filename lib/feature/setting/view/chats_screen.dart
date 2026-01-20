import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_backup_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_history_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_theme_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/transfer_chat_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';
import 'package:whatsapp_clone_getx/utils/theme/pllate/defulat_pallet.dart';
import 'package:whatsapp_clone_getx/utils/theme/pllate/p1.dart';

class ChatsScreen extends GetView<SettingController> {
  static const id = "/ChatsScreen";
  const ChatsScreen({super.key});

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          "Chats",
          style: TextStyle(
            color: AppTheme.whiteColor,
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
                "Display",
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
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
                                color: AppTheme.greyShade900,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Choose theme",
                                      style: TextStyle(
                                        color: AppTheme.whiteColor,
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
                                                  AppTheme.greenAccentShade700,
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
                                                  AppTheme.greenAccentShade700,
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
                    Icon(
                      Icons.settings,
                      size: AppSize.getSize(30),
                      color: AppTheme.greyShade400,
                    ),
                    SizedBox(width: AppSize.getSize(30)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Theme",
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.selectedTheme.value,
                            style: TextStyle(
                              color: AppTheme.greyShade400,
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
                    Icon(
                      Icons.chat,
                      size: AppSize.getSize(30),
                      color: AppTheme.greyShade400,
                    ),
                    SizedBox(width: AppSize.getSize(30)),
                    Text(
                      "Default chat theme",
                      style: TextStyle(
                        color: AppTheme.whiteColor,
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
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Obx(
                () => appInfo(
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
                () => appInfo(
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
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Obx(
                () => appInfo(
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
        Icon(icon, size: AppSize.getSize(30), color: AppTheme.greyShade400),
        SizedBox(width: AppSize.getSize(30)),
        Text(
          title,
          style: TextStyle(
            color: AppTheme.whiteColor,
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
                      color: AppTheme.whiteColor,
                      fontSize: AppSize.getSize(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showSwitch)
            Switch(
              value: switchValue ?? false,
              activeThumbColor: AppTheme.blackColor,
              activeTrackColor: AppTheme.greenAccentShade700,
              inactiveTrackColor: AppTheme.blackColor,
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
          controller.selectedTheme.value = title;
        });

        if (title == "Light") {
          AppTheme.changeTheme(P1());
        } else if (title == "Dark") {
          AppTheme.changeTheme(DefulatPallet());
        } else {
          AppTheme.changeTheme(DefulatPallet());
        }
      },
      child: Container(
        color: AppTheme.greyShade900,
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppTheme.greenAccentShade700
                      : AppTheme.greyColor,
                  width: AppSize.getSize(2),
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: AppSize.getSize(12),
                        width: AppSize.getSize(12),
                        decoration: BoxDecoration(
                          color: AppTheme.greenAccentShade700,
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
                color: AppTheme.whiteColor,
                fontSize: AppSize.getSize(18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
