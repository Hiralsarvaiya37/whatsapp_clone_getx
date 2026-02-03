import 'package:flutter/material.dart';
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

class ChatsScreen extends StatelessWidget {
  static const id = "/ChatsScreen";
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SettingProvider>();
    final theme = context.watch<AppTheme>();
    return Scaffold(
      backgroundColor: theme.blackColor,
      appBar: AppBar(
        backgroundColor: theme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: theme.whiteColor,
          ),
        ),
        title: Text(
          context.l10n.chats,
          style: TextStyle(
            color: theme.whiteColor,
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
                  color: theme.greyShade400,
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
                                color: theme.greyShade900,
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
                                        color: theme.whiteColor,
                                        fontSize: 22,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.getSize(20)),

                                    radioTile(
                                      context.l10n.systemdefault,
                                      dialogSetState,
                                      provider.selectedTheme,
                                      context,
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    radioTile(
                                      context.l10n.light,
                                      dialogSetState,
                                      provider.selectedTheme,
                                      context,
                                    ),
                                    SizedBox(height: AppSize.getSize(30)),
                                    radioTile(
                                      context.l10n.dark,
                                      dialogSetState,
                                      provider.selectedTheme,
                                      context,
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
                                              color: theme.greenAccentShade700,
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
                                              color: theme.greenAccentShade700,
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
                      color: theme.greyShade400,
                    ),
                    SizedBox(width: AppSize.getSize(30)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.theme,
                          style: TextStyle(
                            color: theme.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          provider.selectedTheme,
                          style: TextStyle(
                            color: theme.greyShade400,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatThemeScreen()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.chat,
                      size: AppSize.getSize(30),
                      color: theme.greyShade400,
                    ),
                    SizedBox(width: AppSize.getSize(30)),
                    Text(
                      context.l10n.defaultchattheme,
                      style: TextStyle(
                        color: theme.whiteColor,
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
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              appInfo(
                context,
                context.l10n.enterissend,
                context.l10n.enterkeywillsendyourmessage,
                switchValue: provider.isOn1,
                onChanged: (val) {
                  provider.isOn1 = val;
                },
              ),
              SizedBox(height: AppSize.getSize(30)),
              appInfo(
                context,
                context.l10n.mediavisibility,
                context.l10n.shownewlydownloadedmediainyourdevicesgallery,
                switchValue: provider.isOn2,
                onChanged: (val) {
                  provider.isOn2 = val;
                },
              ),

              SizedBox(height: AppSize.getSize(30)),
              appInfo(
                context,
                context.l10n.fontsize,
                provider.selectedFontSize,
                showSwitch: false,
              ),
              SizedBox(height: AppSize.getSize(30)),
              appInfo(
                context,
                context.l10n.voicemessagetranscripts,
                context.l10n.readnewvoicemessages,
                showSwitch: false,
              ),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                context.l10n.archivedchats,
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              appInfo(
                context,
                context.l10n.keepchatsarchived,
                context
                    .l10n
                    .archivedchatswillremainarchivedwhenyoureceiveanewmessage,
                switchValue: provider.isOn3,
                onChanged: (val) {
                  provider.isOn3 = val;
                },
              ),

              SizedBox(height: AppSize.getSize(40)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatBackupScreen()),
                  );
                },
                child: chatInfo(
                  context.l10n.chatbackup,
                  Icons.backup_outlined,
                  context,
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    (MaterialPageRoute(
                      builder: (context) => TransferChatScreen(),
                    )),
                  );
                },
                child: chatInfo(
                  context.l10n.transferchats,
                  Icons.send_to_mobile_rounded,
                  context,
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatHistoryScreen(),
                    ),
                  );
                },
                child: chatInfo(
                  context.l10n.chathistory,
                  Icons.replay_outlined,
                  context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chatInfo(String title, IconData icon, BuildContext context) {
    final theme = context.watch<AppTheme>();

    return Row(
      children: [
        Icon(icon, size: AppSize.getSize(30), color: theme.greyShade400),
        SizedBox(width: AppSize.getSize(30)),
        Text(
          title,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget appInfo(
    BuildContext context,
    String title,
    String subtitle, {
    bool showSwitch = true,
    bool? switchValue,
    Function(bool)? onChanged,
  }) {
    final theme = context.watch<AppTheme>();

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
                      color: theme.whiteColor,
                      fontSize: AppSize.getSize(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: theme.greyShade400,
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
              activeThumbColor: theme.blackColor,
              activeTrackColor: theme.greenAccentShade700,
              inactiveTrackColor: theme.blackColor,
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
    BuildContext context,
  ) {
    final provider = context.read<SettingProvider>();
    final theme = context.watch<AppTheme>();

    bool isSelected = currentSelected == title;
    return InkWell(
      onTap: () {
        dialogSetState(() {
          provider.selectedTheme = title;
        });

        if (title == "Light") {
          theme.changeTheme(P1());
        } else if (title == "Dark") {
          theme.changeTheme(DefulatPallet());
        } else {
          theme.changeTheme(DefulatPallet());
        }
      },
      child: Container(
        color: theme.greyShade900,
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? theme.greenAccentShade700
                      : theme.greyColor,
                  width: AppSize.getSize(2),
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: AppSize.getSize(12),
                        width: AppSize.getSize(12),
                        decoration: BoxDecoration(
                          color: theme.greenAccentShade700,
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
                color: theme.whiteColor,
                fontSize: AppSize.getSize(18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
