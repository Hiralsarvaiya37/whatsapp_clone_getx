import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/controller/chat_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChatMessagesScreen extends GetView<ChatController> {
  static const id = "/ChatMessagesScreen";
  const ChatMessagesScreen({super.key});

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
        title: Row(
          children: [
            ClipOval(
              child: Image.network(
                "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
                height: AppSize.getSize(40),
                width: AppSize.getSize(40),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: AppSize.getSize(15)),
            Text(
              controller.otherUserName,
              style: TextStyle(
                fontSize: AppSize.getSize(23),
                color: AppTheme.whiteColor,
              ),
            ),
          ],
        ),

        actions: [
          Icon(
            Icons.videocam_outlined,
            size: AppSize.getSize(27),
            color: AppTheme.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(20)),
          Icon(
            Icons.phone,
            size: AppSize.getSize(27),
            color: AppTheme.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(20)),
          Icon(
            Icons.more_vert,
            size: AppSize.getSize(27),
            color: AppTheme.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(15)),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('chats')
                    .doc(controller.chatId)
                    .collection('messages')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text(context.l10n.nomessages));
                  }

                  final docs = snapshot.data!.docs;

                  return ListView.builder(
                    reverse: true,
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final data = docs[index];

                      bool isMe = data['senderId'] == controller.myUserId;

                      return Align(
                        alignment: isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,

                        child: Container(
                          margin: EdgeInsets.only(bottom: AppSize.getSize(8)),
                          padding: EdgeInsets.all(AppSize.getSize(10)),
                          decoration: BoxDecoration(
                            color: isMe
                                ? AppTheme.greenColor
                                : AppTheme.greyShade800,
                            borderRadius: isMe
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    topRight: Radius.circular(1),
                                    bottomLeft: Radius.circular(14),
                                    bottomRight: Radius.circular(14),
                                  )
                                : BorderRadius.only(
                                    topLeft: Radius.circular(1),
                                    topRight: Radius.circular(14),
                                    bottomLeft: Radius.circular(14),
                                    bottomRight: Radius.circular(14),
                                  ),
                          ),
                          child: Text(
                            data['message'] ?? "",
                            style: TextStyle(color: AppTheme.whiteColor),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.getSize(8),
              vertical: AppSize.getSize(6),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.getSize(12),
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.greyShade900,
                      borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sticky_note_2_outlined,
                          color: AppTheme.greyShade400,
                        ),
                        SizedBox(width: AppSize.getSize(10)),

                        Expanded(
                          child: TextField(
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            controller: controller.messageController,
                            minLines: 1,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            cursorColor: AppTheme.greenAccentShade700,
                            cursorWidth: 3,
                            style: TextStyle(color: AppTheme.whiteColor),

                            onChanged: (value) {
                              controller.isShow.value = value.isNotEmpty;
                            },

                            decoration: InputDecoration(
                              hintText: context.l10n.message,
                              hintStyle: TextStyle(
                                color: AppTheme.greyShade400,
                              ),
                              border: InputBorder.none,

                              suffixIcon: Obx(
                                () => Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.attach_file,
                                      color: AppTheme.greyShade400,
                                    ),
                                    if (!controller.isShow.value) ...[
                                      SizedBox(width: AppSize.getSize(8)),
                                      Icon(
                                        Icons.currency_rupee_sharp,
                                        color: AppTheme.greyShade400,
                                      ),
                                      SizedBox(width: AppSize.getSize(8)),
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: AppTheme.greyShade400,
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: AppSize.getSize(8)),
                Container(
                  height: AppSize.getSize(45),
                  width: AppSize.getSize(45),
                  decoration: BoxDecoration(
                    color: AppTheme.greenAccentShade700,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (controller.isShow.value) {
                        sendMessage();
                      } else {}
                    },
                    child: Obx(
                      (() => Icon(
                        controller.isShow.value ? Icons.send : Icons.mic,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() async {
    if (controller.messageController.text.trim().isEmpty) return;

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(controller.chatId)
        .collection('messages')
        .add({
          'message': controller.messageController.text.trim(),
          'senderId': controller.myUserId,
          'time': FieldValue.serverTimestamp(),
        });

    controller.messageController.clear();
    controller.isShow.value = false;
  }
}
