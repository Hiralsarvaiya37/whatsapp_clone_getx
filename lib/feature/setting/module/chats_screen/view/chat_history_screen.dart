import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/controller/chat_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChatHistoryScreen extends GetView<ChatViewController> {
  static const id = "/ChatHistoryScreen";
  const ChatHistoryScreen({super.key});

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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppTheme.whiteColor),
        ),
        title: Text(
          "Chat history",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(25), vertical: AppSize.getSize(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appInfo("Export chat", Icons.file_upload_outlined),
            SizedBox(height: AppSize.getSize(30)),
            Obx(
              ()=> InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
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
                                  "Are you sure want to archive ALL chats?",
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
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
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
                                            controller.isArchived.value = !controller.isArchived.value;
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Ok",
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
                      );
                    },
                  );
                },
                child: appInfo(
                  controller.isArchived.value ? "Unarchive all chats" : "Archive all chats",
                  Icons.archive_outlined,
                ),
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
                                  "Clear all chats?",
                                  style: TextStyle(
                                    color: AppTheme.whiteColor,
                                    fontSize: AppSize.getSize(22),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: AppSize.getSize(20)),

                                InkWell(
                                  onTap: () {
                                    dialogSetState(() {
                                      controller.deleteMedia.value = !controller.deleteMedia.value;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      deleteOptionTile(
                                        1,
                                        "Also delete media received in chats from the device gallery",
                                        dialogSetState,
                                      ),
                                      SizedBox(height: AppSize.getSize(25)),
                                      deleteOptionTile(
                                        2,
                                        "Delete starred messages",
                                        dialogSetState,
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
                                        "Cancel",
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
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Clear chats",
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
                    );
                  },
                );
              },
              child: appInfo("Clear all chats", Icons.remove_circle_outline),
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
                                  "Delete all chats?",
                                  style: TextStyle(
                                    color: AppTheme.whiteColor,
                                    fontSize: AppSize.getSize(22),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: AppSize.getSize(25)),
                                deleteOptionTile(
                                  1,
                                  "Also delete media received in chats from the device gallery",
                                  dialogSetState,
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
                                        "Cancel",
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
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Delete chats",
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
                    );
                  },
                );
              },
              child: appInfo("Delete all chats", Icons.delete),
            ),
          ],
        ),
      ),
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

  Widget deleteOptionTile(int index, String title, StateSetter dialogSetState) {
   return Obx((){
     bool isSelected = controller.selectedDeleteOption.value == index;

    return InkWell(
      onTap: () {
        dialogSetState(() {
          controller.selectedDeleteOption.value = isSelected ? 0 : index;
        });
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
                color: isSelected ? AppTheme.greenAccentShade700 : AppTheme.greyColor,
                width: AppSize.getSize(2),
              ),
            ),
            child: isSelected
                ? Icon(Icons.check, color: AppTheme.blackColor, size: AppSize.getSize(18))
                : SizedBox(),
          ),
          SizedBox(width: AppSize.getSize(20)),
          Expanded(
            child: InkWell(
              onTap: () {
                dialogSetState(() {
                  controller.selectedDeleteOption.value = isSelected ? 0 : index;
                });
              },
              child: Text(
                title,
                style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(16)),
              ),
            ),
          ),
        ],
      ),
    );
   });
  }
}
