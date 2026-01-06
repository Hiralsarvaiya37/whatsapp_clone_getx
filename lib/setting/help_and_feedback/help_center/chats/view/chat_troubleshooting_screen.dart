import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ChatTroubleshootingScreen extends StatelessWidget {
  const ChatTroubleshootingScreen({super.key});

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          "Troubleshooting",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: AppColors.whiteColor,
            ),
            color: AppColors.greyShade900,
            offset: Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppSize.getSize(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getSize(20),
                vertical: AppSize.getSize(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Troubleshooting",
                    style: TextStyle(
                      color: AppColors.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo("Can't send or receive messages", context),
                  appInfo(
                    "About 'Waiting for this message. This may take a while.'",
                    context,
                  ),
                  appInfo(
                    "Seeing 'Waiting for this message. Check your phone'",
                    context,
                  ),
                  appInfo("Fix incorrect timestamps on messages", context),
                  appInfo(
                    "Can't remember password for encrypted backup",
                    context,
                  ),
                  appInfo(
                    "Can't back up or restore your chat history",
                    context,
                  ),
                  appInfo(
                    "Can't move chats from an Android device to an iPhone",
                    context,
                  ),
                  appInfo(
                    "Can't move chats from an iPhone to an Android device",
                    context,
                  ),
                  appInfo("Can't  transfer chat history", context),
                  appInfo("Can't change or assign a group admin", context),
                  appInfo("Can't download, open, or send media files", context),
                  appInfo(
                    "Can't hear voice messages, status audio, or videos",
                    context,
                  ),
                  appInfo("Can't record voice messages", context),
                  appInfo("Seeing blurry photos", context),
                  appInfo("Can't send longer videos", context),
                  appInfo(
                    "What does 'Invite via Link unavailable' mean?",
                    context,
                  ),
                  appInfo("Can't join group with invite link", context),
                  appInfo("How to edit your profile", context),
                  appInfo("How to free up storage on WhatsApp", context),
                  appInfo("How to chnage your ringtone for WhatsApp", context),
                  appInfo("How to use dark mode", context),
                  appInfo("How to change font size", context),
                  SizedBox(height: AppSize.getSize(40)),
                ],
              ),
            ),
          ),
          CommonContactUsButton(),
        ],
      ),
    );
  }

  Widget appInfo(String title, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LearnMoreScreen()),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: AppSize.getSize(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.file_open_sharp,
              size: AppSize.getSize(30),
              color: AppColors.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(30)),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSize.getSize(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
