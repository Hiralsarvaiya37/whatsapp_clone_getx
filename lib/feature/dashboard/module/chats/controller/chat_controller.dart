import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  String chatId = "user1_user2";
  String myUserId = "user1";
  String otherUserId = "user2";
  String otherUserName = "User 2";

  TextEditingController messageController = TextEditingController();
  RxBool isShow = false.obs;
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
  
}
