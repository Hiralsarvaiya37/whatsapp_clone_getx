import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AiExperiencesScreen extends StatelessWidget {
  static const id = "/AiExperiencesScreen";
  const AiExperiencesScreen({super.key});

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
        title: Text(
          "AI Experiences",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: AppTheme.whiteColor,
            ),
            color: AppTheme.greyShade900,
            offset: Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: AppTheme.whiteColor,
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
                    "AI Experiences",
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo(
                    "About AI experiences available through WhatsApp",
                    context,
                  ),
                  appInfo(
                    "About using AI experiences available through WhatsApp",
                    context,
                  ),
                  appInfo("About Meta AI", context),
                  appInfo("How to chat with Meta AI", context),
                  appInfo(
                    "How to chat with Meta AI in an individual or group chat",
                    context,
                  ),
                  appInfo(
                    "About searching WhatsApp and asking Meta AI",
                    context,
                  ),
                  appInfo(
                    "How to ask Meta AI in the WhatsApp search bar",
                    context,
                  ),
                  appInfo(
                    "How to create an animated AI image in a chat",
                    context,
                  ),
                  appInfo(
                    "How to generate an AI image for your profile photo or group icon",
                    context,
                  ),
                  appInfo("How to edit AI-generated images", context),
                  appInfo(
                    "How to edit your photos or images with Meta AI",
                    context,
                  ),
                  appInfo("How to prompt Meta AI with an image", context),
                  appInfo(
                    "How to create and use AI-generated call backgrounds",
                    context,
                  ),
                  appInfo(
                    "How to share an AI-generated image to your status",
                    context,
                  ),
                  appInfo("About AIs", context),
                  appInfo("How to chat with AIs", context),
                  appInfo("How to report an AI", context),
                  appInfo(
                    "About creating an AI through Meta AI Studio",
                    context,
                  ),
                  appInfo(
                    "How to create an AI through Meta AI studio",
                    context,
                  ),
                  appInfo(
                    "How to edit your AI through Meta AI Studio",
                    context,
                  ),
                  appInfo(
                    "How to delete your AI through Meta AI Studio",
                    context,
                  ),
                  appInfo("About AI stickers", context),
                  appInfo("How to create and share AI stickers", context),
                  appInfo(
                    "About the availbility of AI experiences available through WhatsApp",
                    context,
                  ),
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
       Get.toNamed(LearnMoreScreen.id);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: AppSize.getSize(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.file_open_sharp,
              size: AppSize.getSize(30),
              color: AppTheme.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(30)),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppTheme.whiteColor,
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
