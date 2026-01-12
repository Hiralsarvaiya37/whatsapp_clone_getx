import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ChatMessagesScreen extends StatefulWidget {
  const ChatMessagesScreen({super.key});

  @override
  State<ChatMessagesScreen> createState() => _ChatMessagesScreenState();
}

class _ChatMessagesScreenState extends State<ChatMessagesScreen> {
  final TextEditingController messageController = TextEditingController();

  bool isShow = false;
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
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
            SizedBox(width: 15),
            Text(
              "User",
              style: TextStyle(
                fontSize: AppSize.getSize(23),
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),

        actions: [
          Icon(
            Icons.videocam_outlined,
            size: AppSize.getSize(27),
            color: AppColors.whiteColor,
          ),
          SizedBox(width: 20),
          Icon(
            Icons.phone,
            size: AppSize.getSize(27),
            color: AppColors.whiteColor,
          ),
          SizedBox(width: 15),
          Icon(
            Icons.more_vert,
            size: AppSize.getSize(27),
            color: AppColors.whiteColor,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc('user1_user2')
                  .collection('messages')
                  .orderBy('time', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index];

                    bool isMe = data['senderId'] == 'user1';

                    return Align(
                      alignment: isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                        
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.green : Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          data['message'] ?? "",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sticky_note_2_outlined,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(width: 10),

                        Expanded(
                          child: TextField(
                            controller: messageController,
                            minLines: 1,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            cursorColor: Colors.greenAccent.shade700,
                            cursorWidth: 3,
                            style: TextStyle(color: Colors.white),

                            onChanged: (value) {
                              setState(() {
                                isShow = value.isNotEmpty;
                              });
                            },

                            decoration: InputDecoration(
                              hintText: "Message",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: InputBorder.none,

                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.attach_file,
                                    color: Colors.grey.shade400,
                                  ),
                                  if (!isShow) ...[
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.currency_rupee_sharp,
                                      color: Colors.grey.shade400,
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.grey.shade400,
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
                SizedBox(width: 8),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.shade700,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (isShow) {
                        sendMessage();
                      } else {}
                    },
                    child: Icon(isShow ? Icons.send : Icons.mic),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    FirebaseFirestore.instance
        .collection('chats')
        .doc('user1_user2')  
        .collection('messages')
        .add({
          'message': messageController.text.trim(),
          'senderId': 'user1', 
          'time': FieldValue.serverTimestamp(),
        });

    messageController.clear();
    setState(() {
    isShow = false;
  });
  }
}
