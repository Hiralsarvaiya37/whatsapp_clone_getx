import 'package:flutter/widgets.dart';

class ChatState {
  final String chatId;
  final String myUserId;
  final String otherUserName;
  final bool isShow;
  final TextEditingController messageController;

  ChatState({
    required this.chatId,
    required this.myUserId,
    required this.otherUserName,
    required this.isShow,
    required this.messageController,
  });

  ChatState copyWith({
    String? chatId,
    String? myUserId,
    String? otherUserName,
    bool? isShow,
  }) {
    return ChatState(
      chatId: chatId ?? this.chatId,
      myUserId: myUserId ?? this.myUserId,
      otherUserName: otherUserName ?? this.otherUserName,
      isShow: isShow ?? this.isShow,
      messageController: messageController,
    );
  }
}
