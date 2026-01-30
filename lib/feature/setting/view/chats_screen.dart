import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_backup_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_history_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_theme_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/transfer_chat_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/provider/setting_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';
import 'package:whatsapp_clone_getx/utils/theme/pllate/defulat_pallet.dart';
import 'package:whatsapp_clone_getx/utils/theme/pllate/p1.dart';

class ChatsScreen extends StatelessWidget{
  static const id = "/ChatsScreen";
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final provider = context.watch<SettingProvider>();
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
          context.l10n.chats,
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
                context.l10n.display,
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
                                      context.l10n.choosetheme,
                                      style: TextStyle(
                                        color: AppTheme.whiteColor,
                                        fontSize: 22,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(20)),

                                    radioTile(
                                      context.l10n.systemdefault,
                                      dialogSetState,
                                      provider.selectedTheme,
                                      context
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    radioTile(
                                      context.l10n.light,
                                      dialogSetState,
                                      provider.selectedTheme,
                                      context
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    radioTile(
                                      context.l10n.dark,
                                      dialogSetState,
                                      provider.selectedTheme,
                                      context
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
                                            context.l10n.cancel,
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
                                            context.l10n.ok,
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
                          context.l10n.theme,
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                       Text(
                            provider.selectedTheme,
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
                      context.l10n.defaultchattheme,
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
                context.l10n.chatsettings,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
               appInfo(
                  context.l10n.enterissend,
                  context.l10n.enterkeywillsendyourmessage,
                  switchValue: provider.isOn1,
                  onChanged: (val) {
                    provider.isOn1 = val;
                  },
                
              ),
              SizedBox(height: AppSize.getSize(30)),
             appInfo(
                  context.l10n.mediavisibility,
                  context.l10n.shownewlydownloadedmediainyourdevicesgallery,
                  switchValue: provider.isOn2,
                  onChanged: (val) {
                    provider.isOn2 = val;
                  },
                ),
              
              SizedBox(height: AppSize.getSize(30)),
              appInfo(
                context.l10n.fontsize,
                provider.selectedFontSize,
                showSwitch: false,
              ),
              SizedBox(height: AppSize.getSize(30)),
              appInfo(
                context.l10n.voicemessagetranscripts,
                context.l10n.readnewvoicemessages,
                showSwitch: false,
              ),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                context.l10n.archivedchats,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
            appInfo(
                  context.l10n.keepchatsarchived,
                  context.l10n.archivedchatswillremainarchivedwhenyoureceiveanewmessage,
                  switchValue: provider.isOn3,
                  onChanged: (val) {
                    provider.isOn3 = val;
                  },
                
              ),

              SizedBox(height: AppSize.getSize(40)),
              InkWell(
                onTap: () {
                  Get.toNamed(ChatBackupScreen.id);
                },
                child: chatInfo(context.l10n.chatbackup, Icons.backup_outlined),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  Get.toNamed(TransferChatScreen.id);
                },
                child: chatInfo(context.l10n.transferchats, Icons.send_to_mobile_rounded),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  Get.toNamed(ChatHistoryScreen.id);
                },
                child: chatInfo(context.l10n.chathistory, Icons.replay_outlined),
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
    BuildContext context
  ) {
    
 final provider = context.read<SettingProvider>(); 

    bool isSelected = currentSelected == title;
    return InkWell(
      onTap: () {
        dialogSetState(() {
          provider.selectedTheme = title;
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
