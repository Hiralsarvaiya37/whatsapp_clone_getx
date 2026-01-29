import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class ChatProvider extends ChangeNotifier {
  String chatId = "";
  String myUserId = "";
  String otherUserId = "";
  String otherUserName = "";

  TextEditingController messageController = TextEditingController();
  bool isShow = false;
  void updateIsShow(String value) {
  isShow = value.isNotEmpty;
  notifyListeners();
}


  void initChat({
    required String myId,
    required String otherId,
    required String otherName,
  }) {
    myUserId = myId;
    otherUserId = otherId;
    otherUserName = otherName;
    chatId = getChatId(myId, otherId);
  }

  String getChatId(String userA, String userB) {
    return userA.compareTo(userB) < 0 ? "${userA}_$userB" : "${userB}_$userA";
  }

  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    try {
      await FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add({
        'message': text,
        'senderId': myUserId,
        'time': FieldValue.serverTimestamp(),
      });

      messageController.clear();
      isShow = false;
      notifyListeners();
    } catch (e) {
      // print("Error sending message: $e");
    }
  }
}
