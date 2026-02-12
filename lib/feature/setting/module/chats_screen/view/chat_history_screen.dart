import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/bloc/chat_view_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/bloc/chat_view_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/bloc/chat_view_state.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChatHistoryScreen extends StatelessWidget {
  static const id = "/ChatHistoryScreen";
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          context.l10n.chathistory,
          style: TextStyle(
            color: AppTheme.whiteColor,
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
            appInfo(context.l10n.exportchat, Icons.file_upload_outlined),
            SizedBox(height: AppSize.getSize(30)),
            BlocBuilder<ChatViewBloc, ChatViewState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () => showArchiveDialog(context, state.isArchived),
                  child: appInfo(
                    state.isArchived
                        ? context.l10n.unarchiveallchats
                        : context.l10n.archiveallchats,
                    Icons.archive_outlined,
                  ),
                );
              },
            ),
            SizedBox(height: AppSize.getSize(30)),
            InkWell(
              onTap: () => showClearChatsDialog(context),
              child: appInfo(
                context.l10n.clearallchats,
                Icons.remove_circle_outline,
              ),
            ),
            SizedBox(height: AppSize.getSize(30)),
            InkWell(
              onTap: () => showDeleteChatsDialog(context),
              child: appInfo(context.l10n.deleteallchats, Icons.delete),
            ),
          ],
        ),
      ),
    );
  }

  void showArchiveDialog(BuildContext context, bool isCurrentlyArchived) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<ChatViewBloc>(),
          child: Dialog(
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.greyShade900,
                borderRadius: BorderRadius.circular(AppSize.getSize(20)),
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
                        color: AppTheme.greyShade400,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                    SizedBox(height: AppSize.getSize(30)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(dialogContext),
                          child: Text(
                            context.l10n.cancel,
                            style: TextStyle(
                              color: AppTheme.greenAccentShade700,
                              fontSize: AppSize.getSize(16),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: AppSize.getSize(30)),
                        InkWell(
                          onTap: () {
                            context.read<ChatViewBloc>().add(ToggleArchived());
                            Navigator.pop(dialogContext);
                          },
                          child: Text(
                            context.l10n.ok,
                            style: TextStyle(
                              color: AppTheme.greenAccentShade700,
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
          ),
        );
      },
    );
  }

  void showClearChatsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<ChatViewBloc>(),
          child: StatefulBuilder(
            builder: (context, dialogSetState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.getSize(15)),
                ),
                backgroundColor: AppTheme.greyShade900,
                child: Padding(
                  padding: EdgeInsets.all(AppSize.getSize(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.clearallchats,
                        style: TextStyle(
                          color: AppTheme.whiteColor,
                          fontSize: AppSize.getSize(22),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppSize.getSize(20)),
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
                      SizedBox(height: AppSize.getSize(25)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(dialogContext),
                            child: Text(
                              context.l10n.cancel,
                              style: TextStyle(
                                color: AppTheme.greenAccentShade700,
                                fontSize: AppSize.getSize(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: AppSize.getSize(25)),
                          InkWell(
                            onTap: () {
                              Navigator.pop(dialogContext);
                            },
                            child: Text(
                              context.l10n.clearchats,
                              style: TextStyle(
                                color: AppTheme.greenAccentShade700,
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
          ),
        );
      },
    );
  }

  void showDeleteChatsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<ChatViewBloc>(),
          child: StatefulBuilder(
            builder: (context, dialogSetState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.getSize(15)),
                ),
                backgroundColor: AppTheme.greyShade900,
                child: Padding(
                  padding: EdgeInsets.all(AppSize.getSize(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.deleteallchats,
                        style: TextStyle(
                          color: AppTheme.whiteColor,
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
                            onTap: () => Navigator.pop(dialogContext),
                            child: Text(
                              context.l10n.cancel,
                              style: TextStyle(
                                color: AppTheme.greenAccentShade700,
                                fontSize: AppSize.getSize(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: AppSize.getSize(25)),
                          InkWell(
                            onTap: () {
                              Navigator.pop(dialogContext);
                            },
                            child: Text(
                              context.l10n.deletechats,
                              style: TextStyle(
                                color: AppTheme.greenAccentShade700,
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
          ),
        );
      },
    );
  }

  Widget appInfo(String title, IconData icon) {
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

  Widget deleteOptionTile(
    int index,
    String title,
    StateSetter dialogSetState,
    BuildContext context,
  ) {
    return BlocBuilder<ChatViewBloc, ChatViewState>(
      builder: (context, state) {
        final bool isSelected = state.selectedDeleteOption == index;

        return InkWell(
          onTap: () {
            context.read<ChatViewBloc>().add(ChangeDeleteOption(index));
            dialogSetState(() {});
          },
          child: Row(
            children: [
              Container(
                height: AppSize.getSize(22),
                width: AppSize.getSize(22),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.greenAccentShade700
                      : AppTheme.greyShade900,
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.greenAccentShade700
                        : AppTheme.greyColor,
                    width: AppSize.getSize(2),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: AppTheme.blackColor,
                        size: AppSize.getSize(18),
                      )
                    : null,
              ),
              SizedBox(width: AppSize.getSize(20)),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontSize: AppSize.getSize(16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
