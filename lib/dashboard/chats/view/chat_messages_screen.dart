import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ChatMessagesScreen extends StatelessWidget {
  const ChatMessagesScreen({super.key});

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
                "https://thumbs.dreamstime.com/b/two-ladybugs-orange-spring-flower-flight-insect-artistic-macro-image-concept-spring-summer-two-ladybugs-orange-125140826.jpg",
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
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      margin: EdgeInsets.only(right: 10, bottom: 10),
                      constraints: BoxConstraints(
                        maxWidth: AppSize.size.width * 0.8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(1),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Text(
                        "Mess ujyuyujyuyj vkuykhj jhjkhj gkgkjgjkg hkhkj gjkgk ug jgjhggjg kgage",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  width: 355,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(25)
                  ),child: Row(
                    children: [
                      Icon(Icons.sticky_note_2_outlined,size: 25,color: Colors.white,)
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.mic,size: 30,color: Colors.greenAccent.shade700,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
