import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/controller/chat_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/end_to_end_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChatBackupScreen extends GetView<ChatViewController> {
  static const id = "/ChatBackupScreen";
  const ChatBackupScreen({super.key});

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
          context.l10n.chatbackup,
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
                context.l10n.backupsettings,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              Text(
                context.l10n.backupyourchatsandmediatoyourGoogleAccountsstorageYoucanrestorethemonanewphoneafteryoudownloadWhatsApponit,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Text(
                context.l10n.local2_09AM,
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontSize: AppSize.getSize(18),
                ),
              ),
              SizedBox(height: AppSize.getSize(5)),
              Text(
                context.l10n.lastBackupNever,
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontSize: AppSize.getSize(18),
                ),
              ),
              SizedBox(height: AppSize.getSize(25)),
              Container(
                height: AppSize.getSize(42),
                width: AppSize.getSize(110),
                decoration: BoxDecoration(
                  color: AppTheme.greenAccentShade700,
                  borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                ),
                alignment: Alignment.center,
                child: Text(
                  context.l10n.backup,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                context.l10n.manageGogglestorage,
                style: TextStyle(
                  color: AppTheme.greenAccentShade700,
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
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.l10n.chooseanaccount,
                                      style: TextStyle(
                                        color: AppTheme.whiteColor,
                                        fontSize: AppSize.getSize(22),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(40)),
                                    Obx(
                                      () => radioTile(
                                        contex.l10n.abcced123gmail_com,
                                        dialogSetState,
                                        controller.selectedGoogleAccount.value,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    Obx(
                                      () => radioTile(
                                        context.l10n.addaccount,
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
                                            contex.l10n.cancel,
                                            style: TextStyle(
                                              color:
                                                  AppTheme.greenAccentShade700,
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
                      context.l10n.goggleAccount,
                      style: TextStyle(
                        color: AppTheme.whiteColor,
                        fontSize: AppSize.getSize(18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.selectedGoogleAccount.value,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
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
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.l10n.automaticbackups,
                                      style: TextStyle(
                                        color: AppTheme.whiteColor,
                                        fontSize: AppSize.getSize(22),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(40)),
                                    Obx(
                                      () => radioTile(
                                        context.l10n.daily,
                                        dialogSetState,
                                        controller.backupFrequency.value,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    Obx(
                                      () => radioTile(
                                        contex.l10n.weekly,
                                        dialogSetState,
                                        controller.backupFrequency.value,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    Obx(
                                      () => radioTile(
                                        context.l10n.monthly,
                                        dialogSetState,
                                        controller.backupFrequency.value,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    Obx(
                                      () => radioTile(
                                        contex.l10n.onlywhenItapBackup,
                                        dialogSetState,
                                        controller.backupFrequency.value,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    Obx(
                                      () => radioTile(
                                        contex.l10n.off,
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
                                            contex.l10n.cancel,
                                            style: TextStyle(
                                              color:
                                                  AppTheme.greenAccentShade700,
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
                      context.l10n.automaticbackups,
                      style: TextStyle(
                        color: AppTheme.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.backupFrequency.value,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.getSize(35)),
              appTile(context.l10n.includevideos, 1),
              SizedBox(height: AppSize.getSize(30)),
              appTile(context.l10n.backupusingcellular, 2),

              SizedBox(height: AppSize.getSize(40)),
              Text(
                context.l10n.endtoendencryption,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              Text(
                context.l10n.foraddedsecurityyoucanprotectyourbackupwithendtoendencryption,
                style: TextStyle(
                  color: AppTheme.greyShade400,
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
                        color: AppTheme.greyShade400,
                      ),
                      SizedBox(width: AppSize.getSize(20)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.endtoendencryptedbackup,
                            style: TextStyle(
                              color: AppTheme.whiteColor,
                              fontSize: AppSize.getSize(18),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            context.l10n.off,
                            style: TextStyle(
                              color: AppTheme.greyShade400,
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
                  color: AppTheme.whiteColor,
                  fontSize: AppSize.getSize(18),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Switch(
              value: switchValue,
              activeThumbColor: AppTheme.blackColor,
              activeTrackColor: AppTheme.greenAccentShade700,
              inactiveTrackColor: AppTheme.blackColor,
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
              fontSize: AppSize.getSize(16),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
