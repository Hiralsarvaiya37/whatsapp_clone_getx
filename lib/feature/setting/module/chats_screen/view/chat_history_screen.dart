import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/provider/chat_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChatHistoryScreen extends StatelessWidget {
  static const id = "/ChatHistoryScreen";
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatViewProvider>();
 final theme = Provider.of<AppTheme>(context, listen: false);
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
          context.l10n.chathistory,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(25),
          vertical: AppSize.getSize(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appInfo(context.l10n.exportchat, Icons.file_upload_outlined,context),
            SizedBox(height: AppSize.getSize(30)),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.l10n.areyousurewanttoarchiveALLchats,
                                style: TextStyle(
                                  color: theme.greyShade400,
                                  fontSize: AppSize.getSize(16),
                                ),
                              ),
                              SizedBox(height: AppSize.getSize(30)),
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
                                      chatProvider.toggleArchive();
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
              child: appInfo(
                chatProvider.isArchived
                    ? context.l10n.unarchiveallchats
                    : context.l10n.archiveallchats,
                Icons.archive_outlined,context
              ),
            ),

            SizedBox(height: AppSize.getSize(30)),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, dialogSetState) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(15),
                            ),
                          ),
                          backgroundColor: theme.greyShade900,
                          child: Padding(
                            padding: EdgeInsets.all(AppSize.getSize(20)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.l10n.clearallchats,
                                  style: TextStyle(
                                    color: theme.whiteColor,
                                    fontSize: AppSize.getSize(22),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: AppSize.getSize(20)),

                                InkWell(
                                  onTap: () {
                                    dialogSetState(() {
                                      chatProvider.deleteMedia =
                                          !chatProvider.deleteMedia;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      deleteOptionTile(
                                        1,
                                        context
                                            .l10n
                                            .alsodeletemediareceivedinchatsfromthedevicegallery,
                                        dialogSetState,
                                        context,
                                      ),
                                      SizedBox(height: AppSize.getSize(25)),
                                      deleteOptionTile(
                                        2,
                                        context.l10n.deletestarredmessages,
                                        dialogSetState,
                                        context,
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: AppSize.getSize(25)),

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
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: AppSize.getSize(25)),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        context.l10n.clearchats,
                                        style: TextStyle(
                                          color: theme.greenAccentShade700,
                                          fontSize: AppSize.getSize(16),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: AppSize.getSize(20)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: appInfo(
                context.l10n.clearallchats,
                Icons.remove_circle_outline,context
              ),
            ),

            SizedBox(height: AppSize.getSize(30)),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, dialogSetState) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(15),
                            ),
                          ),
                          backgroundColor: theme.greyShade900,
                          child: Padding(
                            padding: EdgeInsets.all(AppSize.getSize(20)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.l10n.deleteallchats,
                                  style: TextStyle(
                                    color: theme.whiteColor,
                                    fontSize: AppSize.getSize(22),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: AppSize.getSize(25)),
                                deleteOptionTile(
                                  1,
                                  context
                                      .l10n
                                      .alsodeletemediareceivedinchatsfromthedevicegallery,
                                  dialogSetState,
                                  context,
                                ),

                                SizedBox(height: AppSize.getSize(25)),

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
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: AppSize.getSize(25)),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        context.l10n.deletechats,
                                        style: TextStyle(
                                          color: theme.greenAccentShade700,
                                          fontSize: AppSize.getSize(16),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: AppSize.getSize(20)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: appInfo(context.l10n.deleteallchats, Icons.delete,context),
            ),
          ],
        ),
      ),
    );
  }

  Widget appInfo(String title, IconData icon, BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
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

  Widget deleteOptionTile(
    int index,
    String title,
    StateSetter dialogSetState,
    BuildContext context,
  ) {
    final chatProvider = context.read<ChatViewProvider>();
 final theme = Provider.of<AppTheme>(context, listen: false);
    bool isSelected = chatProvider.selectedDeleteOption == index;

    return InkWell(
      onTap: () {
        dialogSetState(() {
          chatProvider.selectedDeleteOption = isSelected ? 0 : index;
        });
      },
      child: Row(
        children: [
          Container(
            height: AppSize.getSize(22),
            width: AppSize.getSize(22),
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.greenAccentShade700
                  : theme.greyShade900,
              border: Border.all(
                color: isSelected
                    ? theme.greenAccentShade700
                    : theme.greyColor,
                width: AppSize.getSize(2),
              ),
            ),
            child: isSelected
                ? Icon(
                    Icons.check,
                    color: theme.blackColor,
                    size: AppSize.getSize(18),
                  )
                : SizedBox(),
          ),
          SizedBox(width: AppSize.getSize(20)),
          Expanded(
            child: InkWell(
              onTap: () {
                dialogSetState(() {
                  chatProvider.selectedDeleteOption = isSelected ? 0 : index;
                });
              },
              child: Text(
                title,
                style: TextStyle(
                  color: theme.whiteColor,
                  fontSize: AppSize.getSize(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
