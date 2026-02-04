import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChatLockScreen extends StatelessWidget {
  static const id ="/ChatLockScreen";
  const ChatLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return Scaffold(
      backgroundColor: theme.blackColor,
      appBar: AppBar(
        backgroundColor: theme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: theme.whiteColor),
        ),
        title: Text(
          "Chat lock",
          style: TextStyle(
            color: theme.whiteColor,
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
            Icon(Icons.lock, size: AppSize.getSize(70), color: theme.greenAccentShade700),
            SizedBox(height: AppSize.getSize(30)),
            Text(
              "Chat lock keeps your chats locked and hidden",
              style: TextStyle(fontSize: AppSize.getSize(25), color: theme.whiteColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.getSize(25)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "If you have locked chats, pull down on your chat list or type your secret code in the search bar to find them. ",
                    style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      color: theme.blueshade500,
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
              style: TextStyle(fontSize: 18, color: theme.whiteColor),
            ),
              ],
            ),
            SizedBox(height: AppSize.getSize(5)),
            Text(
              "If you forgot your secretcode, you can clear it. This will also unlock and clear messages, photos and videos in locked chats.",
              style: TextStyle(fontSize: AppSize.getSize(16), color: theme.greyShade400),
            ),
          ],
        ),
      ),
    );
  }
}
