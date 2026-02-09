import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/bloc/chat_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/bloc/chat_event.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/bloc/chat_state.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChatMessagesScreen extends StatelessWidget {
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
        title: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return Row(
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
                  state.otherUserName,
                  style: TextStyle(
                    fontSize: AppSize.getSize(23),
                    color: AppTheme.whiteColor,
                  ),
                ),
              ],
            );
          },
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
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.getSize(15),
                  ),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('chats')
                        .doc(state.chatId)
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

                          bool isMe = data['senderId'] == state.myUserId;

                          return Align(
                            alignment: isMe
                                ? Alignment.centerRight
                                : Alignment.centerLeft,

                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: AppSize.getSize(8),
                              ),
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
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(25),
                          ),
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
                                controller: state.messageController,
                                minLines: 1,
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                                cursorColor: AppTheme.greenAccentShade700,
                                cursorWidth: 3,
                                style: TextStyle(color: AppTheme.whiteColor),

                                onChanged: (value) {
                                  context.read<ChatBloc>().add(
                                    TypingEvent(value.isNotEmpty),
                                  );
                                },

                                decoration: InputDecoration(
                                  hintText: context.l10n.message,
                                  hintStyle: TextStyle(
                                    color: AppTheme.greyShade400,
                                  ),
                                  border: InputBorder.none,

                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.attach_file,
                                        color: AppTheme.greyShade400,
                                      ),
                                      if (!state.isShow) ...[
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
                          if (state.isShow) {
                            sendMessage(context);
                          } else {}
                        },
                        child: Icon(state.isShow ? Icons.send : Icons.mic),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void sendMessage(BuildContext context) async {
    final chatBloc = context.read<ChatBloc>();
    final state = chatBloc.state;

    final text = state.messageController.text.trim();
    if (text.isEmpty) return;

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(state.chatId)
        .collection('messages')
        .add({
          'message': text,
          'senderId': state.myUserId,
          'time': FieldValue.serverTimestamp(),
        });

    state.messageController.clear();
    chatBloc.add(TypingEvent(false));
  }
}
