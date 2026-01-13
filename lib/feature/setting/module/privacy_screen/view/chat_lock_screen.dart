import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ChatLockScreen extends StatelessWidget {
  static const id ="/ChatLockScreen";
  const ChatLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppColors.whiteColor),
        ),
        title: Text(
          "Chat lock",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.getSize(20)),
            Icon(Icons.lock, size: AppSize.getSize(70), color: AppColors.greenAccentShade700),
            SizedBox(height: AppSize.getSize(30)),
            Text(
              "Chat lock keeps your chats locked and hidden",
              style: TextStyle(fontSize: AppSize.getSize(25), color: AppColors.whiteColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.getSize(25)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "If you have locked chats, pull down on your chat list or type your secret code in the search bar to find them. ",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      color: AppColors.blueshade500,
                      fontSize: AppSize.getSize(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.getSize(40)),
            Row(
              children: [
                Text(
              "Unlock and clear locked chats",
              style: TextStyle(fontSize: 18, color: AppColors.whiteColor),
            ),
              ],
            ),
            SizedBox(height: AppSize.getSize(5)),
            Text(
              "If you forgot your secretcode, you can clear it. This will also unlock and clear messages, photos and videos in locked chats.",
              style: TextStyle(fontSize: AppSize.getSize(16), color: AppColors.greyShade400),
            ),
          ],
        ),
      ),
    );
  }
}
