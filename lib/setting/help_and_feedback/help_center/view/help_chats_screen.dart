import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/setting/help_and_feedback/help_center/chats/view/ai_experiences_screen.dart';
import 'package:whatsapp_clone_getx/setting/help_and_feedback/help_center/chats/view/back_up_and_restore_screen.dart';
import 'package:whatsapp_clone_getx/setting/help_and_feedback/help_center/chats/view/chat_troubleshooting_screen.dart';
import 'package:whatsapp_clone_getx/setting/help_and_feedback/help_center/chats/view/individual_and_groupchats_screen.dart';
import 'package:whatsapp_clone_getx/setting/help_and_feedback/help_center/chats/view/media_screen.dart';
import 'package:whatsapp_clone_getx/setting/help_and_feedback/help_center/chats/view/notification_screen.dart';
import 'package:whatsapp_clone_getx/setting/help_and_feedback/help_center/chats/view/video_notes_screen.dart';
import 'package:whatsapp_clone_getx/setting/help_and_feedback/help_center/chats/view/voice_messages_and_chats_screen.dart';
import 'package:whatsapp_clone_getx/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class HelpChatsScreen extends StatelessWidget {
  const HelpChatsScreen({super.key});

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
          "Help Center",
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.getSize(20),
              vertical: AppSize.getSize(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chats",
                  style: TextStyle(
                    color: AppColors.greyShade400,
                    fontSize: AppSize.getSize(16),
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndividualAndGroupchatsScreen(),
                      ),
                    );
                  },
                  child: appInfo(
                    "Individual and Group Chats",
                    Icons.chat_bubble,
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BackUpAndRestoreScreen(),
                      ),
                    );
                  },
                  child: appInfo(
                    "Back Up and Restore",
                    Icons.cloud_upload_rounded,
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationScreen(),
                      ),
                    );
                  },
                  child: appInfo("Notifications", Icons.notifications),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MediaScreen()),
                    );
                  },
                  child: appInfo("Media", Icons.image),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VoiceMessagesAndChatsScreen(),
                      ),
                    );
                  },
                  child: appInfo(
                    "Voice Messages and Chats",
                    Icons.keyboard_voice_rounded,
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoNotesScreen(),
                      ),
                    );
                  },
                  child: appInfo("Video Notes", Icons.video_call_rounded),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AiExperiencesScreen(),
                      ),
                    );
                  },
                  child: appInfo(
                    "AI Experiences",
                    Icons.switch_access_shortcut_add_rounded,
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatTroubleshootingScreen(),
                      ),
                    );
                  },
                  child: appInfo("Troubleshooting", Icons.help),
                ),
                SizedBox(height: AppSize.getSize(30)),
              ],
            ),
          ),
          CommonContactUsButton(),
        ],
      ),
    );
  }

  Widget appInfo(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: AppSize.getSize(25),
          color: AppColors.greenAccentShade700,
        ),
        SizedBox(width: AppSize.getSize(25)),
        Text(
          title,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
